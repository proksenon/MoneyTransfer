//
//  ContactButtonDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

struct ContactButtonDecorator: ViewDecorator {

	/// Title of Label
	let title: String

	func decorate(view: UIView) {
		guard let button = view as? UIButton else { return }
		button.backgroundColor = UIColor.white
		button.setTitle(title, for: .normal)
		button.setTitleColor(.black, for: .normal)
	}

}


