//
//  HelperNavigationController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 11/9/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class HelperNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        getName()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getName() {
        let helper = self.parent
        print(helper?.title)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
