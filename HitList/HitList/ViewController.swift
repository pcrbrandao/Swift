//
//  ViewController.swift
//  HitList
//
//  Created by Pedro Brandão on 02/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = Controller.sharedInstance
    let tableViewController = TableViewController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addName(sender: AnyObject) {
        controller.addName(InView: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "The List"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = tableViewController
        tableView.dataSource = tableViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        controller.loadPeople()
    }
    
}

