//
//  roundview.swift
//  CodeX
//
//  Created by Developer on 13/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class roundview : UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
