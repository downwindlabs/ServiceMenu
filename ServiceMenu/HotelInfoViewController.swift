//
//  HotelInfoViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 11/2/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class HotelInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var infoWebView: UIWebView!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingBackground: UIButton!
    
    let infoArray = ["The Salon at Ceasars",
                    "Rooftop Pool",
                    "Qua Baths and Spa",
                    "The Playground",
                    "Retro's",
                    "Property Map"]
    
    let urls  = ["https://www.caesars.com/content/dam/cac/Misc/Caesars-Atlantic%20City-Misc-1.pdf",
                 "https://www.caesars.com/caesars-ac/things-to-do/the-rooftop-pool#.WButzXeZPUp",
                 "https://www.caesars.com/caesars-ac/things-to-do/qua-baths-and-spa#.WBuutHeZPUo",
                 "https://www.caesars.com/caesars-ac/things-to-do/the-pier-shops#.WBuu5neZPUo",
                 "https://www.caesars.com/caesars-ac/things-to-do/retros#.WBuvQHeZPUo",
                 "http://caesarsmeansbusiness.com/wp-content/uploads/2013/12/Caesars-Atlantic-City-Meeting-Facilities-Map-Chart-Property-Map.pdf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoWebView.delegate = self
        
        loadingLabel.isHidden = true
        loadingIndicator.isHidden = true
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        loadingBackground.isHidden = true
        loadingBackground.layer.cornerRadius = 30
        loadingBackground.layer.borderColor = UIColor.gray.cgColor
        
        loadingBackground.layer.zPosition = 0
        loadingLabel.layer.zPosition = 1
        loadingIndicator.layer.zPosition = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        let infoLabel = infoArray[indexPath.row]
        cell.textLabel!.text = infoLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = NSURL(string: urls[indexPath.row])
        let urlRequest = NSURLRequest(url: url as! URL)
        infoWebView.loadRequest(urlRequest as URLRequest)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        arrowImage.isHidden = true
        labelText.isHidden = true
        
        loadingLabel.isHidden = false
        loadingIndicator.isHidden = false
        loadingBackground.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        loadingLabel.isHidden = true
        loadingBackground.isHidden = true
    }
    
    func loadingActivity() {
        
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
