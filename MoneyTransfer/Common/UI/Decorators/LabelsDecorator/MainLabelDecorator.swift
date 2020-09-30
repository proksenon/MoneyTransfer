//
//  MainLabelDecorate.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Label decorator in style Main
struct MainLabelDecorator: ViewDecorator {
	/// Title of Label
	let title: String
	
	func decorate(view: UIView) {
		guard let label = view as? UILabel else { return }
		label.backgroundColor = .clear
		label.font = UIFont(name: "Futura Medium", size: 18)
		label.textAlignment = .center
		label.textColor = .black
		label.text = title
	}

}
