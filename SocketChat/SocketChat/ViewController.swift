//
//  ViewController.swift
//  SocketChat
//
//  Created by Pedro Brandão on 17/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = Controller.sharedController

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var mensagemLabel: UILabel!
    
    @IBAction func joinButton(_ sender: UIButton) {
        guard let mensagem = loginField.text else {
            mensagemLabel.text = "Tente outra vez"
            return
        }
        mensagemLabel.text = "enviando..."
        self.controller.enviar(mensagem: mensagem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

