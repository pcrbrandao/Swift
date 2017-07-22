//
//  CustomLabel.swift
//  TipCalculator
//
//  Created by Pedro Brandão on 22/07/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top:0, left: 5, bottom: 0, right: 5)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
