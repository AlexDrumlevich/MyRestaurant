//
//  MenuController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import  UIKit

class MenuController {
    
    // MARK: - ... Properties
    
    static let orderUpdateNotification = Notification.Name("MenuController.orderUpdated")
    
    let baseURL = URL(string: "http://api.armenu.net:8090/")!

//    var menuItem: MenuItem? {
//        didSet {
//        NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
//    }
//    }
//    var order = Order() {
//        didSet {
//            NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
//        }
//    }
    var orderedMials: [Order] = [] {
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
        }
    }
    
    static let shared = MenuController()
    
    // MARK: - ... Private init
    private init() { }
    
    // MARK: - ... Methods
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        
        let task = URLSession.shared.dataTask(with: categoryURL) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                completion(nil)
                return
            }
            
            let categories = jsonDictionary?["categories"] as? [String]
            
            completion(categories)
        }
        
        task.resume()
    }
    

    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "category", value: categoryName)
        ]
        
        guard let menuURL = components.url else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: menuURL) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
          
            let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
            
            completion(menuItems?.items)
        }
        
        task.resume()
    }
    
    
    func fetchMenuItemImage(forImageURL imageURL: URL?, forIndexItem indexItem: Int, completion: @escaping (UIImage?, Int) -> Void) {
        
        guard let imageURL = imageURL  else {
            completion(nil, indexItem)
            return
        }
        
        var initialImageURL = baseURL
        for (index, value) in imageURL.pathComponents.enumerated() {
            if index == 0 {continue}
            initialImageURL = initialImageURL.appendingPathComponent(value)
        }
        
        let task = URLSession.shared.dataTask(with: initialImageURL) { (data, _, _) in
            guard let data = data else {
                completion(nil, indexItem)
                return
            }
            let image = UIImage(data: data)
            completion(image, indexItem)
        }
        task.resume()
    }
        
  
    
    

    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void) {
        let orderURL = baseURL.appendingPathComponent("order")
        
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data)
            
            completion(preparationTime?.prepTime)
        }
        
        task.resume()
    }
}
