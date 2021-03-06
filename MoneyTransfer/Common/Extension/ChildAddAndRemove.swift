//
//  ChildAddAndRemove.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
///	Работа с ChildController
extension UIViewController {
	/// Добавляет Child Controller
	/// - Parameter child: ChildViewController
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

	/// Удаляет ChildController
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
