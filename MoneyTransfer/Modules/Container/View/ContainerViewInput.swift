//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol ContainerViewInput: class {
	///  Устанавливает затемнение
	func setupDimmView()
	///  Устанавливает тап по затемнению
	func tapOutSite()
	///  Анимирует переход
	func showTransaction(show: Bool, view: UIView, y: ViewSize?)
	/// Настраивает кнопку Назад
	func setBackButton()
	/// Устанавливает на childs контроллеры gesture
	/// - Parameter views: Child Views
	func setGesture(views: [UIView])
	/// Двигает view
	/// - Parameter view: Двигаемое view
	func moveView(with view: UIView)
}
