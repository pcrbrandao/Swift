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
    
    var guestBooksViewController: GuestBooksViewController?
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var guestTitle: UITextField!
    @IBOutlet weak var content: UITextField!
    @IBAction func addGuestBook(_ sender: UIButton) {
        
        let entry = controller.addEntry(email: email.text!, title: guestTitle.text!, content: content.text!)
        if (entry?.ok)! {
            alerta(titulo: "Registro adicionado", mensagem: "Registro adicionado com sucesso!")
        } else {
            alerta(titulo: "Erro adicionando", mensagem: "Houve uma falha tentando adicionar um registro")
        }
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
    
    // exibe um alerta com ok
    func alerta(titulo: String, mensagem: String) {
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        // let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
        //    print("Destructive")
        // }
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            let _ = self.navigationController?.popViewController(animated: true)
        }
        // alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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


