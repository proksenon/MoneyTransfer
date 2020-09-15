//
//  StyleTransactionButtons.swift
//  MoneyTransfer
//
//  Created by 18579132 on 14.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIButton {
	func styleButton(title: String, color: UIColor = .green) {
		self.backgroundColor = color
		self.setTitle(title, for: .normal)
		self.titleLabel?.textColor = .white
		self.roundedCorner(with: 15)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}

}
