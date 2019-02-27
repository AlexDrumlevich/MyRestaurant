//
//  OrderTableViewController.swift
//  MyRestaurant
//
//  Created by Друмлевич on 23.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    @IBOutlet weak var submitButton: UIBarButtonItem!
    
    var orderMinutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            tableView,
            selector: #selector(UITableView.reloadData),
            name: MenuController.orderUpdateNotification,
            object: nil
        )
    }
    
    func uploadOrder() {
        var menuIds: [Int] {
            var arrayIds: [Int] = []
            for orderItem in MenuController.shared.orderedMials {
                arrayIds += Array(repeating: orderItem.menuItem.id, count: orderItem.qantity)
            }
            return arrayIds
        }
        MenuController.shared.submitOrder(forMenuIDs: menuIds) { minutes in
            guard let minutes = minutes else { return }
            
            self.orderMinutes = minutes
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ConfirmationSegue", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ConfirmationSegue" else { return }
        
        let controller = segue.destination as! OrderConfirmationViewController
        controller.minutes = orderMinutes
    }
    
    @IBAction func submitTapped() {
        let orderItems = MenuController.shared.orderedMials
        var orderCount: Int {
            var count = 0
            for orderItem in orderItems {
                count += orderItem.qantity
            }
            return count
        }
        
        let orderTotal = orderItems.reduce(0) { $0 + ($1.menuItem.price * Double($1.qantity)) }
        let formattedOrder = String(format: "$%.2f", orderTotal)
        
        let alert = UIAlertController(
            title: "Confirm Order",
            message: "Your total is \(orderCount) item(s) for \(formattedOrder)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Submit",
            style: .default,
            handler: { _ in
                self.uploadOrder()
        }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
        
        present(alert, animated: true, completion: nil)
    }
    

    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "DismissConfirmation" else {return}
        
        MenuController.shared.orderedMials.removeAll()
    }
    
    @IBAction func plusButtonTapped(sender: UIButton) {
        
        
        MenuController.shared.orderedMials[sender.tag].qantity += 1
        
    }
    
    @IBAction func minusButtonTapped(sender: UIButton) {
        
        guard MenuController.shared.orderedMials[sender.tag].qantity > 0 else {
            return
        }
        
        MenuController.shared.orderedMials[sender.tag].qantity -= 1
        
        if MenuController.shared.orderedMials[sender.tag].qantity == 0 {
            let alertController = UIAlertController(title: "Delete from order?", message: nil, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "YES", style: .default) { (_) in
                MenuController.shared.orderedMials.remove(at: sender.tag)
            }
            let noAction = UIAlertAction(title: "NO", style: .default) { (_) in
                MenuController.shared.orderedMials[sender.tag].qantity = 1
            }
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            self.present(alertController, animated: true, completion: nil)
        }
    
    }
   
}
