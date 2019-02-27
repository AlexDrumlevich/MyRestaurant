//
//  OrderTableViewCell.swift
//  MyRestaurant
//
//  Created by Друмлевич on 25.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var qantityLabel: UILabel!
 
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
}
