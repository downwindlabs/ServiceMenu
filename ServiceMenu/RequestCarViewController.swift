//
//  RequestCarViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/28/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit
import UserNotifications

class RequestCarViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var minuteCounterLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    
    var timer = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subtitleLabel.isHidden = true
        
        requestButton.layer.cornerRadius = 10
    }
    
    @IBAction func requestButtonPressed(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Request Confirmation", message: "Are you sure you want to request your car?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let orderAction = UIAlertAction(title: "Request", style: .default) {
            UIAlertAction in
            self.carRequested()
            self.update()
        }
        alertController.addAction(orderAction)
        
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    func carRequested() {
        titleLabel.text = "Car Requested."
        subtitleLabel.isHidden = false
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        requestButton.isEnabled = false
        requestButton.backgroundColor = UIColor.lightGray
        self.scheduleNotification()
    }
    
    func update() {
        if(timer > 0){
            let minutes = String(timer / 60)
            let seconds = String(timer % 60)
            let sec = timer % 60
            minuteCounterLabel.text = "0" + minutes + ":" + seconds
            if sec < 10 {
                minuteCounterLabel.text = "0" + minutes + ":" + "0" + seconds
            }
            if timer < 60 {
                minuteCounterLabel.text = "00:" + String(timer)
                minuteLabel.text = "seconds"
            }
            timer -= 1
        }
        
    }
    
    func scheduleNotification() {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.title = "Car Ready"
        content.body = "Your car is ready!"
    
        let request = UNNotificationRequest(identifier: "requestIdentifier", content: content, trigger: trigger)
        
        content.categoryIdentifier = "clearCategory"
        
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
  
}
