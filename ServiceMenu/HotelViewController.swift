//
//  HotelViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/28/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class HotelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let helpArray = ["Home",
                     "Food",
                     "Item2",
                     "Item3",
                     "Item4",
                     "Item5",
                     "Item6"]
    
    // MARK: tableView delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath as IndexPath)
        
        let helpLabel = helpArray[indexPath.row]
        print(helpLabel)
        cell.textLabel!.text = helpLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    
    // MARK: Navigation

    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddCigarMode = presentingViewController is UINavigationController!
    
        if isPresentingInAddCigarMode {
            self.dismiss(animated: true, completion: nil)
        }
    
        print("cxld from chart")
    }
}
