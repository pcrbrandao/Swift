//
//  Controller.swift
//  TimeTable-Swift
//
//  Created by Pedro Brandão on 24/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

enum DiaDaSemana: String {
    case dom = "domingo"
    case seg = "segunda"
    case ter = "terça"
    case qua = "quarta"
    case qui = "quinta"
    case sex = "sexta"
    case sab = "sábado"
}

class Controller: UITableViewController {
    
    static let sharedController = Controller()
    
    var diasDeAula: [DiaDaSemana] = [.seg, .ter, .qua, .qui, .sex]
    var materias = ["português", "matemática", "história", "geografia"]
    var materiasPorDia = [DiaDaSemana: [String]]()
    var materiasIndice = [[String]]()
    
    func dictionary(withKeys keys:[DiaDaSemana], andValues values:[String]) -> [DiaDaSemana: [String]] {
        var dictionary = [DiaDaSemana: [String]]()
        for key in keys {
            dictionary[key] = values
        }
        return dictionary
    }
    
    func addRoll() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        materiasPorDia = self.dictionary(withKeys: diasDeAula, andValues: materias)
        materiasIndice = [[String]](materiasPorDia.values)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return materiasPorDia.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return (materiasPorDia[diasDeAula[section]]?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "\((indexPath as NSIndexPath).row): \(materiasIndice[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row])"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell")
        let headers = [DiaDaSemana](materiasPorDia.keys)
        cell!.textLabel?.text = headers[section].rawValue
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let dia = diasDeAula[(indexPath as NSIndexPath).section]
            var materiasDoDia = materiasPorDia[dia]
            materiasDoDia?.remove(at: (indexPath as NSIndexPath).row)
            materiasPorDia[dia] = materiasDoDia
            materiasIndice[(indexPath as NSIndexPath).section] = materiasDoDia!
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            // tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
