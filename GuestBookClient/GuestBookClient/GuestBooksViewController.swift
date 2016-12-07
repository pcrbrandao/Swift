//
//  ViewController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class GuestBooksViewController: UIViewController {
    
    
    let mainTableViewController = MainTableViewController.sharedInstance
    let guestBookController = GuestBookController.sharedController
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = mainTableViewController
        tableView.dataSource = mainTableViewController
        
        let bb = UIBarButtonItem()
        bb.title = ""
        
        self.navigationItem.backBarButtonItem = bb

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

