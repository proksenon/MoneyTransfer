//
//  ContactStyleButton.swift
//  MoneyTransfer
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIButton {
	/// Стиль кнопки на экрае контакты
	/// - Parameter title: Title of label
	func contactStyleButton(title: String) {
		self.backgroundColor = UIColor.white
		self.setTitle(title, for: .normal)
		self.setTitleColor(.black, for: .normal)
		self.roundedCorner(with: 4)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10).isActive = true
	}
}
