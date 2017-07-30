//
//  Calculator.swift
//  TipCalculator
//
//  Created by Pedro Brandão on 22/07/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    
    var calcVC: CalculatorViewController!
    
    init(with viewController: CalculatorViewController) {
        self.calcVC = viewController
    }
    
    func calculate() {
        let tipPercent = Double(self.calcVC.percentSlider.value)
        self.calcVC.percentLabel.text = tipPercent.toPercent()
        
        let maxLength = 10
        
        if var input = self.calcVC.inputField.text?.characters, input.count > maxLength {
            input.removeLast()
            print("\nValor excede o permitido...\(String(input))\n")
            self.calcVC.inputField.text = String(input)
            return
        }
        
        guard let amount = Double(self.calcVC.inputField.text!), amount > 0 else {
            self.calcVC.totalAmountLabel.text = 0.0.toCurrency()
            self.calcVC.amountLabel.text = NSLocalizedString("Enter Amount", comment: "")
            self.calcVC.tipAmountLabel.text = 0.0.toCurrency()
            return
        }
        
        let tip = amount / 100.0 * tipPercent
        let total = (amount / 100.00) + tip
        
        self.calcVC.amountLabel.text = (amount / 100.0).toCurrency()
        
        
        self.calcVC.tipAmountLabel.text = tip.toCurrency()
        self.calcVC.totalAmountLabel.text = total.toCurrency()
    }
}

extension Double {
    func toCurrency() -> String {
        let number = NSDecimalNumber(decimal: Decimal(self))
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: number)!
    }
    
    func toPercent() -> String {
        return String(format: "%.1f%%", self * 100.0)
    }
}
