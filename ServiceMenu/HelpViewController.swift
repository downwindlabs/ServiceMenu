//
//  HelpViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/26/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate {
  
    @IBOutlet weak var helpTableView: UITableView!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingBackground: UIButton!
    
    let helpArray = ["Main Menu",
                     "Room Service Menu",
                     "Attractions Menu",
                     "Weather Menu",
                     "Hotel Info Menu",
                     "Valet Menu"]
    
    let url = Bundle.main.url(forResource: "mainmenu", withExtension: "html")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingLabel.isHidden = true
        loadingIndicator.isHidden = true
        
        webView.delegate = self
        
        helpTableView.dataSource = self
        helpTableView.delegate = self
        
        loadingBackground.isHidden = true
        loadingBackground.layer.cornerRadius = 30
        loadingBackground.layer.borderColor = UIColor.gray.cgColor
        
        loadingBackground.layer.zPosition = 0
        loadingLabel.layer.zPosition = 1
        loadingIndicator.layer.zPosition = 1

    }
    
    // MARK: tableView delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath as IndexPath)
        
        let helpLabel = helpArray[indexPath.row]
        cell.textLabel!.text = helpLabel
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        labelText.isHidden = true
        arrowImage.isHidden = true
        
        loadingLabel.isHidden = false
        loadingIndicator.isHidden = false
        loadingBackground.isHidden = false
        loadingIndicator.startAnimating()
        
        let name = helpArray[indexPath.row]
        
        let url = Bundle.main.url(forResource: name, withExtension: "html")
        let urlRequest = NSURLRequest(url: url! as URL)
        webView.loadRequest(urlRequest as URLRequest)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        loadingLabel.isHidden = true
        loadingBackground.isHidden = true
    }
    
    // MARK: Navigation
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresenting = presentingViewController is UINavigationController!
        
        if isPresenting {
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    

}
