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
        self.calcVC.amountLabel.text?.toCurrency(value: self.calcVC.inputField.text!)
        
        guard let amount = Double(self.calcVC.inputField.text!) else {
            return
        }
        
        let tipPercent = Double(self.calcVC.percentSlider.value)
        let tip = amount / 100.0 * tipPercent
        
        self.calcVC.tipAmountLabel.text = tip.toCurrency()
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
}

extension String {
    mutating func toCurrency(value: String) {
        guard let amount = Int(value), amount > 0 else {
            self = NSLocalizedString("Enter Amount", comment: "")
            return
        }
        let amountDouble = Double(amount) / 100.0
        self = amountDouble.toCurrency()
    }
}
