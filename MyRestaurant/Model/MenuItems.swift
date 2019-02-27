//
//  MenuItems.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    var image: UIImage?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
        
        
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
