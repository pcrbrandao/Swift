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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        let person = controller.people[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = person.value(forKey: "name") as? String
        
        return cell
    }

}
