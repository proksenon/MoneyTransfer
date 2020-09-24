//
//  MainInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainViewInput: class {
	///  Обновляет таблицу
	func tableViewReload()
	///  Устанавливает кнопку,  которая будет скролть к верху
	func setScrollAtTopButton()
	///  Устанавливает кнопку скролла в навигейшн
	func navigationWithScrollAtTop()
	///  Скрывает навигейшнбар
	func navigationBarIsHidden(_ isHidden: Bool)
	///  Устанавливает баланс в тайтл
	func setBalanceTitleWith(balance: String)
	///  Скрывает навигейшн тайтл
	func navigationTitleIsHidden(_ isHidden: Bool)
	///  Показывает или скрывает затемняющую вьюшку
	func showDimmView(_ show: Bool)
	///  Настраивает нажатие на затемняющую вьшку, что бы закрывать SuccessViewController
	func tapOutSite()
}
