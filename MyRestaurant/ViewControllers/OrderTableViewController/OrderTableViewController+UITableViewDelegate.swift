//
//  OrderTableViewController+UITableViewDelegate.swift
//  MyRestaurant
//
//  Created by Друмлевич on 26.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//
import UIKit

extension OrderTableViewController { //UITableViewDelegate

override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    switch editingStyle {
    case .delete:
        MenuController.shared.orderedMials.remove(at: indexPath.row)
    case .insert:
        break
    case .none:
        break
    }
}
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



