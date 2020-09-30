//
//  StyledLabel.swift
//  MoneyTransfer
//
//  Created by 18579132 on 29.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class StyledLabel: UILabel {
	enum Style {
		case subLabelStyle(title: String)
		case mainLabelStyle(title: String)
	}
	
	var style: Style = .mainLabelStyle(title: "") {
		didSet{
			switch style {
			case .subLabelStyle(let title):
				self.backgroundColor = .clear
				self.font = self.font.withSize(14)
				self.textColor = .gray
				self.textAlignment = .center
				self.text = title
			case .mainLabelStyle(let title):
				self.backgroundColor = .clear
				self.font = UIFont(name: "Futura Medium", size: 18)
				self.textAlignment = .center
				self.textColor = .black
				self.text = title
			}
		}
	}
}
