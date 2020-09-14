//
//  StylesLabel.swift
//  MoneyTransfer
//
//  Created by 18579132 on 14.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UILabel {
	func subLabel(title: String) {
		self.backgroundColor = .clear
		self.font = self.font.withSize(14)
		self.textColor = .gray
		self.textAlignment = .center
		self.text = title
		self.heightAnchor.constraint(equalToConstant: 15).isActive = true
	}

	func mainLabel(title: String) {
		self.backgroundColor = .clear
		self.font = UIFont(name: "Futura Medium", size: 18)
		self.textAlignment = .center
		self.textColor = .black
		self.text = title
		self.heightAnchor.constraint(equalToConstant: 20).isActive = true
	}

	func strikeThrough(_ isStrikeThrough:Bool) {
    if isStrikeThrough {
        if let lblText = self.text {
            let attributeString =  NSMutableAttributedString(string: lblText)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
            self.attributedText = attributeString
        }
    } else {
        if let attributedStringText = self.attributedText {
            let txt = attributedStringText.string
            self.attributedText = nil
            self.text = txt
            return
        }
    }
    }
}
