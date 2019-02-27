//
//  MenuNavigationController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 27.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import UIKit
class MenuNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        print("Hello from navController")
      tabBarItem.image = UIImage(named: "middleCart")
        
        
    
    }
}
