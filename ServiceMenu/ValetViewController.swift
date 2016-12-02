//
//  ValetViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/28/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class ValetViewController: UIViewController {
    
    @IBOutlet weak var requestCarButton: UIButton!
    @IBOutlet weak var locateCarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button Config
        requestCarButton.layer.cornerRadius = 30
        requestCarButton.layer.borderWidth = 4
        requestCarButton.layer.borderColor = UIColor.white.cgColor
        
        locateCarButton.layer.cornerRadius = 30
        locateCarButton.layer.borderWidth = 4
        locateCarButton.layer.borderColor = UIColor.white.cgColor
        
    }
}
