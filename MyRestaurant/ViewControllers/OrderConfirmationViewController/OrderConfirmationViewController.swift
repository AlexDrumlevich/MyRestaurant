//
//  OrderConfirmationViewController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     navigationItem.setHidesBackButton(true, animated: false)
        timeRemainingLabel.text = "Thank you for your order!  Your wait time is \(minutes!) minutes."
    }
}
