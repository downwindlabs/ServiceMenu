//
//  AttractionsViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/29/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class AttractionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate {

    @IBOutlet weak var attractionsTable: UITableView!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingBackground: UIButton!
    
    let attractionsArray = ["Steel Pier",
                            "Tanger Outlets",
                            "Absecon Lighthouse",
                            "Atlantic City Aquarium",
                            "Batsto Village",
                            "Six Flags Great Adventure"]
    
    let urls  = ["http://www.steelpier.com",
                 "https://www.tangeroutlet.com/atlanticcity",
                 "http://abseconlighthouse.org",
                 "https://www.acaquarium.com",
                 "http://www.batstovillage.org",
                 "https://www.sixflags.com/greatadventure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingLabel.isHidden = true
        loadingIndicator.isHidden = true
        
        webView.delegate = self

        attractionsTable.dataSource = self
        attractionsTable.delegate = self
        
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
        return attractionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        let attractionsLabel = attractionsArray[indexPath.row]
        cell.textLabel!.text = attractionsLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let url = NSURL(string: urls[indexPath.row])
        let urlRequest = NSURLRequest(url: url as! URL)
        webView.loadRequest(urlRequest as URLRequest)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
