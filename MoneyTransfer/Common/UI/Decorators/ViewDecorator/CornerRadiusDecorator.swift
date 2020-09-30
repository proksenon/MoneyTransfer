//
//  CornerRadiusDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Закругляет углы
struct CornerRadiusDecorator: ViewDecorator {
	/// Радиус закругления
	let cornerRadius: CGFloat

	func decorate(view: UIView) {
		view.clipsToBounds = true
		view.layer.cornerRadius = cornerRadius
	}
}
