//
//  Controller.swift
//  HitList
//
//  Created by Pedro Brandão on 02/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//
// seguindo o tutorial

import UIKit
import CoreData

class Controller: NSObject {
    
    var people = [NSManagedObject]()
    
    static let sharedInstance = Controller()
    
    func addName(InView view:ViewController) {
        
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            self.saveName(textField!.text!)
            view.tableView.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {(action:UIAlertAction) -> Void in })
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        view.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        person.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Não posso salvar \(error), \(error.userInfo)")
        }
    }
    
    func loadPeople() {
        if people.count == 0 {
            //1
            let appDelegate =
                UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            //2
            let fetchRequest = NSFetchRequest(entityName: "Person")
            
            //3
            do {
                let results =
                    try managedContext.executeFetchRequest(fetchRequest)
                people = results as! [NSManagedObject]
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
    }
}
