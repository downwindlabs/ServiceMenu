//
//  InfoViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 11/8/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var infoType: String!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if infoType == "food" {
        webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "foodInfo", ofType: "html")!)))
        }
        
        if infoType == "attractions" {
            webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "attractionsInfo", ofType: "html")!)))
        }
        
        if infoType == "hotelInfo" {
            webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "hotelInfo", ofType: "html")!)))
        }
        
        if infoType == "valet" {
            webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "valetInfo", ofType: "html")!)))
        }
        
        if infoType == "weather" {
            webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "weatherInfo", ofType: "html")!)))
        }
        //let home = NSURL(string: "https://www.caesars.com/caesars-ac")
        //let homeReq = NSURLRequest(url: home as! URL)
        //webView.loadRequest(homeReq as URLRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destViewController = segue.destination as! MainViewController
        

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
