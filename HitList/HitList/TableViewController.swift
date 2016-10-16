//
//  TableViewController.swift
//  HitList
//
//  Created by Pedro Brandão on 02/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class TableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let controller = Controller.sharedInstance
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // Configure the cell...
        let person = controller.people[indexPath.row]
        cell.textLabel!.text = person.valueForKey("name") as? String
        
        return cell
    }

}
