//
//  TabBarController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 27.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import UIKit
class TabBarController: UITabBarController {
    
    static let shared = TabBarController()
    
    
    // MARK: - ... Private init
   
    

    
    func setImage(imageName: String) {
        tabBar.items?[1].image = UIImage(named: imageName)
        tabBar.updateConstraints()
    }
//        tabBar.items![0] = UITabBarItem(title: "Menu", image: UIImage(named: "bigCart")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "bigCart"))
//
//        tabBar.items?[0].image = UIImage(named: "bigCart")
//
//        let imageNameForSelectedState = "bigCart"
//        let imageNameForUnselectedState = "bigCart"
//
//        tabBar.items?[0].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
//         tabBar.items?[0].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
//
    
//        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
//        let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
//
//        tabBar.items?[0].appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
//        tabBar.items?[0].appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
    
}
