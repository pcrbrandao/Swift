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
        
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            self.saveName(textField!.text!)
            view.tableView.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(action:UIAlertAction) -> Void in })
        alert.addTextField { (textField: UITextField) -> Void in }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func saveName(_ name: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        
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
                UIApplication.shared.delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            //2
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
            
            //3
            do {
                let results =
                    try managedContext.fetch(fetchRequest)
                people = results as! [NSManagedObject]
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
    }
}
