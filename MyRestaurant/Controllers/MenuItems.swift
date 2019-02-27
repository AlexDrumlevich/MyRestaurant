//
//  MenuItems.swift
//  MyRestaurant
//
//  Created by Друмлевич on 24.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation

class MenuItems {
    
    static let shared = MenuItems()
    private init() {}
    var menuItems = [MenuItem]()
}
