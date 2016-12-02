//
//  MainViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/26/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIBarButtonItem!
    
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var attractionsButton: UIButton!
    @IBOutlet weak var hotelButton: UIButton!
    @IBOutlet weak var valetButton: UIButton!
    @IBOutlet weak var weatherButton: UIButton!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    
    var greetingName: String!
    
    let todaysDate: NSDate = NSDate()

    func convertDateFormate(date : NSDate) -> String {
        
        let dateFormate1 = DateFormatter()
        let dateFormate2 = DateFormatter()
        dateFormate1.dateFormat = "EEEE, MMMM dd"
        dateFormate2.dateFormat = "EEEE, MMMM "
        let dateN1 = dateFormate1.string(from: date as Date)
        let dateN2 = dateFormate2.string(from: date as Date)
        
        var days = (dateN1 as NSString).substring(from: dateN1.characters.count-2)
        let digit = (dateN1 as NSString).substring(from: dateN1.characters.count-1)
        
        let daysInt: Int = Int(days)!
        
        if daysInt < 10 {
            days = digit
        }
        
        switch (digit) {
        case "1":
            days.append("st")
        case "2":
            days.append("nd")
        case "3":
            days.append("rd")
        default:
            days.append("th")
        }
        
        let finalDate = dateN2 + days
        return finalDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingName = "Jim"

        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getTime), userInfo: nil, repeats: true)
        
        // Button Config

        foodButton.layer.cornerRadius = 30
        foodButton.layer.borderWidth = 4
        foodButton.layer.borderColor = UIColor.white.cgColor
        
        attractionsButton.layer.cornerRadius = 30
        attractionsButton.layer.borderWidth = 4
        attractionsButton.layer.borderColor = UIColor.white.cgColor
        
        hotelButton.layer.cornerRadius = 30
        hotelButton.layer.borderWidth = 4
        hotelButton.layer.borderColor = UIColor.white.cgColor
        hotelButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        valetButton.layer.cornerRadius = 30
        valetButton.layer.borderWidth = 4
        valetButton.layer.borderColor = UIColor.white.cgColor
        
        weatherButton.layer.cornerRadius = 30
        weatherButton.layer.borderWidth = 4
        weatherButton.layer.borderColor = UIColor.white.cgColor
        

    }
    
    func getTime() {
        let timeFormat = DateFormatter()
        let todaysDate: NSDate = NSDate()
        let fixedDate = self.convertDateFormate(date: todaysDate)
        
        timeFormat.dateFormat = "hh:mm a"
        timeFormat.amSymbol = "AM"
        timeFormat.pmSymbol = "PM"
        let time = timeFormat.string(from: todaysDate as Date)
        timeLabel.text = time
        
        dateLabel.text = fixedDate
        
        var timeOfDay = ""
        let hour = NSCalendar.current.component(.hour, from: todaysDate as Date)
        
        if 0...12 ~= hour {
            timeOfDay = "Morning"
        }
        if 12...18 ~= hour {
            timeOfDay = "Afternoon"
        }
        if 18...24 ~= hour {
            timeOfDay = "Evening"
        }
        
        greetingLabel.text = "Good " + timeOfDay + ", " + greetingName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

