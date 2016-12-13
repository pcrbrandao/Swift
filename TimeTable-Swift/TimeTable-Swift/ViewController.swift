//
//  ViewController.swift
//  TimeTable-Swift
//
//  Created by Pedro Brandão on 24/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let controller = Controller.sharedController
    
    @IBOutlet var tableView: UITableView!
    @IBAction func addRoll(_ sender: AnyObject) {
        controller.addRoll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderCell")
        tableView.delegate = controller
        tableView.dataSource = controller
        
        controller.refreshControl?.beginRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

