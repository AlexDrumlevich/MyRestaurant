//
//  MenuItemDetailViewController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupUI()
        updateUI()
    }
    
    func setupUI() {
        addToOrderButton.layer.cornerRadius = 5
        
    }
    
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        imageView.image = menuItem.image
    }
    
    func addInOrder() {
        let id = menuItem.id
        if MenuController.shared.orderedMials.isEmpty {
            MenuController.shared.orderedMials.append(Order(qantity: 1, menuItem: menuItem))
            return
        }
        for (index, itemInOrder) in MenuController.shared.orderedMials.enumerated() {
            if itemInOrder.menuItem.id == id {
                MenuController.shared.orderedMials[index].qantity += 1
                break
            } else if index == MenuController.shared.orderedMials.count - 1 {
            MenuController.shared.orderedMials.append(Order(qantity: 1, menuItem: menuItem))
            }
    }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.addToOrderButton.transform = CGAffineTransform.identity
        }
        
        addInOrder()
       
    }
}
