//
//  GradientViewDecorator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Gradient View Decorator
struct GradientViewDecorator: ViewDecorator {

	/// Array of CGcolor for gradient
	let colors: [CGColor]
	/// Start position of gradient
	var startPoint: CGPoint = CGPoint(x: 0, y: 0)
	/// End gradient
	var stopPoint: CGPoint = CGPoint(x: 1, y: 1)
	/// Frame of View
	var frame: CGRect? = nil

	func decorate(view: UIView) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = colors
		gradientLayer.startPoint = startPoint
		gradientLayer.endPoint = stopPoint
		if let frame = frame {
			gradientLayer.frame = frame
		} else {
			gradientLayer.frame = view.frame
		}
		view.layer.insertSublayer(gradientLayer, at: 0)
	}

}
