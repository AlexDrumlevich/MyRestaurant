//
//  OrderTableViewController+UITableViewDataSource.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

extension OrderTableViewController/*: UITableViewDataSource*/ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MenuController.shared.orderedMials.count == 0 {
            submitButton.isEnabled = false
        } else {
            submitButton.isEnabled = true
        }
        return MenuController.shared.orderedMials.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderTableViewCell
        let menuItem = MenuController.shared.orderedMials[indexPath.row].menuItem
     
        cell.menuItemLabel.text = menuItem.name
        let priceString = String(Double(MenuController.shared.orderedMials[indexPath.row].qantity) * menuItem.price)
   
       // cell.totalPriceLabel.text = String(format: "$%.2f", priceString) не работает
        cell.totalPriceLabel.text = "$ " + priceString
      
        cell.qantityLabel.text = "x " + String(MenuController.shared.orderedMials[indexPath.row].qantity)
        cell.plusButton.tag = indexPath.row
        cell.minusButton.tag = indexPath.row
        
        
        return cell
    }
   
    


}
