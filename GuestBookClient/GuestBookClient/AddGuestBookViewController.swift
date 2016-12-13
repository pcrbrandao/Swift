//
//  AddGuestBookViewController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 04/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class AddGuestBookViewController: UIViewController {
    
    let controller = GuestBookController.sharedController
    let tableController = MainTableViewController.sharedInstance
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var guestTitle: UITextField!
    @IBOutlet weak var content: UITextField!
    @IBAction func addGuestBook(_ sender: UIButton) {
        
        controller.addEntry(email: email.text!, title: guestTitle.text!, content: content.text!, withView:self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        email.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


