//
//  MyOrdersViewController.swift
//  ServiceMenu
//
//  Created by Mark Fisher on 10/29/16.
//  Copyright © 2016 Downwind Labs. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentOrdersLabel: UILabel!
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var food: [String] = [""]
    var quantity: [String] = [""]
    var image: [UIImage] = [UIImage(named: "logo.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.orderTableView.rowHeight = 90
        self.orderTableView.allowsSelection = false
        self.orderTableView.delegate = self
        self.orderTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath as IndexPath) as! OrderTableViewCell
        
        cell.foodName?.text = food[indexPath.row]
        cell.foodQuantity?.text = quantity[indexPath.row]
        cell.foodImage?.image = image[indexPath.row]

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
