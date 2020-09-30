//
//  DecorateView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIView {

	/// Decorate view
	/// - Parameter decorator: decorator for view
	func decorate(with decorator: ViewDecorator) {
		decorator.decorate(view: self)
	}

	/// Decorate view with Array View Decorators
	/// - Parameter decorators: Array View Decorators
	func decorate(with decorators: [ViewDecorator]) {
		decorators.forEach { $0.decorate(view: self) }
	}
}
