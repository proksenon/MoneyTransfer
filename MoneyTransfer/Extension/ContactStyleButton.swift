//
//  ContactStyleButton.swift
//  MoneyTransfer
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIButton {
	func contactStyleButton(title: String) {
		self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
		self.setTitle(title, for: .normal)
		self.titleLabel?.textColor = .black
		self.roundedCorner(with: 4)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10).isActive = true
	}
}
