//
//  FoodViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/28/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    @IBOutlet weak var orderFoodButton: UIButton!
    @IBOutlet weak var myOrdersButton: UIButton!
    
    var foodName:[String] = ["No orders to show."]
    var foodQuantity:[String] = ["N/A"]
    var foodImage:[UIImage] = [UIImage(named: "logo.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Button Config
        orderFoodButton.layer.cornerRadius = 30
        orderFoodButton.layer.borderWidth = 4
        orderFoodButton.layer.borderColor = UIColor.white.cgColor
        
        myOrdersButton.layer.cornerRadius = 30
        myOrdersButton.layer.borderWidth = 4
        myOrdersButton.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {

    }
  
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOrders" {

            if let ovc = segue.destination as? MyOrdersViewController {
                ovc.food.remove(at: 0)
                ovc.quantity.remove(at: 0)
                ovc.image.remove(at: 0)
                
                if foodName.count > 1 {
                    if foodName[0] == "No orders to show." {
                        foodName.remove(at: 0)
                        foodQuantity.remove(at: 0)
                        foodImage.remove(at: 0)
                    }
                    ovc.food.append(contentsOf: foodName)
                    ovc.quantity.append(contentsOf: foodQuantity)
                    ovc.image.append(contentsOf: foodImage)
                } else {
                    ovc.food.append(foodName[0])
                    ovc.quantity.append(foodQuantity[0])
                    ovc.image.append(foodImage[0])
                }
            }
        }
    }
    
    
}
