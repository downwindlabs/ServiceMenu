//
//  WeatherViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 11/5/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingBackground.layer.cornerRadius = 30
        loadingBackground.layer.borderColor = UIColor.gray.cgColor
        
        loadingBackground.layer.zPosition = 0
        loadingLabel.layer.zPosition = 1
        loadingIndicator.layer.zPosition = 1
        
        webView.delegate = self
        
        let home = NSURL(string: "https://www.wunderground.com/us/nj/atlantic-city")
        let homeReq = NSURLRequest(url: home as! URL)
        webView.loadRequest(homeReq as URLRequest)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        loadingLabel.isHidden = true
        loadingBackground.isHidden = true
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
