//
//  ViewDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// View Decorator Protocol
protocol ViewDecorator {
	/// Декорирует
	/// - Parameter view: Вью, которую декорирует функция
	func decorate(view: UIView)
}
