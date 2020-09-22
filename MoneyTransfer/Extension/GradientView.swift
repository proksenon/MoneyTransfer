//
//  GradientView.swift
//  MoneyTransfer
//
//  Created by 18579132 on 22.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension UIView {
	func gradient(with colors: [CGColor], startPoint: CGPoint = CGPoint(x: 0, y: 0), stopPoint: CGPoint = CGPoint(x: 1, y: 1), frame: CGRect? = nil){

		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [UIColor.gray.cgColor, UIColor.black.cgColor]//Colors you want to add
		gradientLayer.startPoint = startPoint
		gradientLayer.endPoint = stopPoint
		if let frame = frame {
			gradientLayer.frame = frame
		} else {
			gradientLayer.frame = self.frame
		}
		self.layer.insertSublayer(gradientLayer, at: 0)
	}
}
