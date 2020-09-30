//
//  StrikeLabelDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Стиль зачеркнутого лейбла
struct StrikeLabelDecorator: ViewDecorator {

	/// True - зачеркивает label
	let isStrikeThrough: Bool

	func decorate(view: UIView) {
		guard let label = view as? UILabel else { return }
		if isStrikeThrough {
			if let lblText = label.text {
				let attributeString =  NSMutableAttributedString(string: lblText)
				attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
				label.attributedText = attributeString
			}
		} else {
			if let attributedStringText = label.attributedText {
				let txt = attributedStringText.string
				label.attributedText = nil
				label.text = txt
				return
			}
		}
	}

}
