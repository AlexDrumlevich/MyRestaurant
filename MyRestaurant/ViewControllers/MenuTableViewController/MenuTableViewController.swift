//
//  MenuTableViewController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var category: String!
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.capitalized
        
        MenuController.shared.fetchMenuItems(forCategory: category) { menuItems in
            guard var menuItems = menuItems else { return }
            
          
            for indexMenuItem in 0..<menuItems.count{
                let urlMenuItem: URL? = menuItems[indexMenuItem].imageURL
                MenuController.shared.fetchMenuItemImage(forImageURL: urlMenuItem, forIndexItem: indexMenuItem, completion: { (image, index) in
                    menuItems[index].image = image
                    if index == menuItems.count - 1 {
                self.updateUI(with: menuItems)
                    }
                })
                
            }
            
            
            
            
            
        }
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuDetailSegue" else { return }
        
        let controller = segue.destination as! MenuItemDetailViewController
        
        let index = tableView.indexPathForSelectedRow!.row
        
        let menuItem = menuItems[index]
        
        controller.menuItem = menuItem
    }
}
