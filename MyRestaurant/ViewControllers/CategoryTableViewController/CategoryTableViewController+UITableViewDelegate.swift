//
//  CategoryTableViewController+UITableViewDelegate.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

extension CategoryTableViewController/*: UITabBarDelegate*/ {
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        label.text = "    \(categories.count) categories loaded"
        
        let view = UIView()
        view.addSubview(label)
        
        return view
    }
}

