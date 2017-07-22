//
//  Detalhe2ViewController.swift
//  MasterDetailSwift
//
//  Created by Pedro Brandão on 26/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import Foundation
import UIKit

class Detalhe2ViewController: UIViewController {
    
    @IBOutlet weak var detalheLabel: UILabel!
    
    var detailItem: NSDate? {
        didSet {
            self.configuraView();
        }
    }
    
    func configuraView() -> Void {
        if let detail = self.detailItem {
            if let label = self.detalheLabel {
                label.text = detail.description
            }
        }
    }
    
}
