//
//  OrderFoodViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/29/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit
import UserNotifications

class OrderFoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    var quantity: Int = 0
    var food: String = ""
    var image: UIImage?
    var quantityString: String = ""
    
    var count = 0
    
    var names:[String]?
    var quantities:[String]?
    var images:[UIImage]?
    
    let pickerData = ["0", "1", "2", "3", "4", "5", "6"]
    let foodData = ["Hamburger",
                    "Cheeseburger",
                    "Pizza - 10\"",
                    "Pizza - 16\"",
                    "Buffalo Wings",
                    "Cheesecake"]
    let descriptionData = ["100% Angus beef patty, lettuce, tomato, and onions on a sesame seed bun.",
                           "100% Angus beef patty, cheddar cheese, lettuce, tomato, and onions on a sesame seed bun.",
                           "Plain cheese pizza with homemade tomato sauce cooked in our coal-fired oven, 10 inches.",
                           "Plain cheese pizza with homemade tomato sauce cooked in our coal-fired oven, 16 inches.",
                           "One dozen chicken wings tossed in a spicy buffalo sauce, served with bleu cheese and celery.",
                           "A single-serving of cheesecake with a raspberry swirl."]
    let imageData = ["hamburger.png",
                     "hamburger.png",
                     "pizza10.png",
                     "pizza10.png",
                     "wings.png",
                     "cheesecake.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        orderButton.layer.cornerRadius = 10
        
        updateButton()
        
        descriptionLabel.numberOfLines = 0
        
        self.foodTableView.dataSource = self
        self.foodTableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath as IndexPath)
        
        let helpLabel = foodData[indexPath.row]
        cell.textLabel!.text = helpLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        food = foodData[indexPath.row]
        image = UIImage(named: imageData[indexPath.row])
        titleLabel.text = food
        descriptionLabel.text = descriptionData[indexPath.row]
        self.foodImage.image = image
        updateButton()
    }
    
    func updateButton() {
        if quantity <= 0 {
            orderButton.backgroundColor = UIColor.lightGray
            decreaseButton.isEnabled = false
        } else if quantity > 0 {
            decreaseButton.isEnabled = true
            if titleLabel.text != "Select an item..." {
                orderButton.backgroundColor = UIColor.green
            }
        }
    }
    
    @IBAction func orderButtonPressed(_ sender: AnyObject) {
        if orderButton.backgroundColor == UIColor.green {
            names?.append(food)
            quantityString = String(quantity)
            quantities?.append(quantityString)
            images?.append(image!)
            
            let alertController = UIAlertController(title: "Order Confirmation", message: "Are you sure you want to order " + quantityString + " " + food + "?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            let orderAction = UIAlertAction(title: "Order", style: .default) {
                UIAlertAction in
                self.orderPlaced()
            }
            
            alertController.addAction(orderAction)
            
            self.present(alertController, animated: true, completion:nil)
        } else {
            if titleLabel.text == "Select an item..." {
                let confirmation = UIAlertController(title: "No item selected!", message: "To place a food order, you must first select an item. To select an item, choose one from the list by tapping on it.", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in })
                
                confirmation.addAction(OKAction)
                
                self.present(confirmation, animated: true, completion: nil)
            } else if quantityLabel.text == "0" {
                let confirmation = UIAlertController(title: "No quantity selected!", message: "To place a food order, you must first select a quantity greater than 0. To select a quantity, tap on the 0 and scroll up or down.", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in })
                
                confirmation.addAction(OKAction)
                
                self.present(confirmation, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func decreaseQuantity(_ sender: Any) {
        quantity -= 1
        quantityLabel.text = String(quantity)
        updateButton()
    }
    
    @IBAction func increaseQuantity(_ sender: Any) {
        quantity += 1
        quantityLabel.text = String(quantity)
        updateButton()
    }
    
    func scheduleNotification() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.title = "Food Order Ready"
        if quantity > 1 {
            content.body = "Your " + quantityString + " " + food + " are ready!"
        } else {
            content.body = "Your " + quantityString + " " + food + " is ready!"
        }
        
        let request = UNNotificationRequest(identifier: "requestIdentifier", content: content, trigger: trigger)

        content.categoryIdentifier = "clearCategory"
        
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
    func orderPlaced() {
        let confirmation = UIAlertController(title: "Order Confirmed", message: "Your order for " + self.quantityString + " " + self.food + " has been sent.", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
        })
        
        confirmation.addAction(OKAction)
        
        self.present(confirmation, animated: true, completion: nil)
        self.scheduleNotification()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMenu" {
            if let fvc = segue.destination as? FoodViewController {
                fvc.foodName.append(food)
                fvc.foodQuantity.append(quantityString)
                fvc.foodImage.append(image!)
            }
        }
    }
}
    


