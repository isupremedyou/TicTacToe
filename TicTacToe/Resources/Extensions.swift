//
//  Extensions.swift
//  TicTacToe
//
//  Created by Travis Chapman on 12/27/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UIButton {
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
    }
}
