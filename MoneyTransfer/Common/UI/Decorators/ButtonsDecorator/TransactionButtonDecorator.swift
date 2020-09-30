//
//  TransactionButtonDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Decorator Transactions Buttons
struct TransactionButtonDecorator: ViewDecorator {

	/// Title of Label
	let title: String
	/// TextColor
	var color: UIColor = .green
	
	func decorate(view: UIView) {
		guard let button = view as? UIButton else { return }
		button.backgroundColor = color
		button.setTitle(title, for: .normal)
		button.titleLabel?.textColor = .white
	}

}
