//
//  PopupViewController.swift
//  ImageViewer
//
//  Created by Pedro Brandão on 24/02/2018.
//  Copyright © 2018 Pedro Brandão. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    var popUpText = "Popup View Default"

    @IBOutlet weak var popUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpLabel.text = popUpText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
