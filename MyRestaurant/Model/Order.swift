//
//  Order.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

//struct Order: Codable {
//    var menuItems: [MenuItem]
//
//
//    init(menuItems: [MenuItem] = []) {
//        self.menuItems = menuItems
//    }
//}

struct Order {
   
   
    var qantity = 0
    var menuItem: MenuItem
    
    init(qantity: Int, menuItem: MenuItem) {
        self.qantity = qantity
        self.menuItem = menuItem
    }
}
