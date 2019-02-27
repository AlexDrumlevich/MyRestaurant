//
//  MenuTableViewController+UITableViewDataSourse.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//
import UIKit

extension MenuTableViewController/*: UITableViewDataSource*/ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        cell.menuLabel.text = menuItems[indexPath.row].name
        
        
        cell.priceLabel.text = String(format: "$%.2f", menuItems[indexPath.row].price)
        
        cell.menuItemImage.image = menuItems[indexPath.row].image
        cell.menuItemImage.layer.cornerRadius = cell.menuItemImage.frame.height / 2
        cell.menuItemImage.clipsToBounds = true
        
                return cell
    }
    
//    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
//        let menuItem = menuItems[indexPath.row]
//
//        cell.textLabel?.text = menuItem.name
//        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
//
//
//    }
}
