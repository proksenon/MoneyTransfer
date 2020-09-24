//
//  RoundedCorners.swift
//  MoneyTransfer
//
//  Created by 18579132 on 14.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIView {
	/// Закругляет углы
	/// - Parameter radius: Радиус
	func roundedCorner(with radius: CGFloat) {
		self.layer.cornerRadius = radius
		self.clipsToBounds = true
	}
}
