//
//  ViewController.swift
//  TipCalculator
//
//  Created by Pedro Brandão on 22/07/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleNavItem: UINavigationItem!
    @IBOutlet var amountLabel: CustomLabel!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var percentSlider: UISlider!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var calculator: Calculator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calculator = Calculator.init(with: self)
        self.inputField.becomeFirstResponder()
        self.setupText()
        self.setupAparence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupText() {
        self.titleNavItem.title = NSLocalizedString("Tip Calculator", comment: "")
        self.amountLabel.text = NSLocalizedString("Enter Amount", comment: "")
        self.tipLabel.text = NSLocalizedString("Tip", comment: "")
        self.totalLabel.text = NSLocalizedString("Total", comment: "")
    }
    
    func setupAparence() {
        self.amountLabel.layer.shadowOpacity = 0.7
        self.amountLabel.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    @IBAction func typingAmount(_ sender: UITextField) {
        
        self.calculator.calculate()
    }
}




