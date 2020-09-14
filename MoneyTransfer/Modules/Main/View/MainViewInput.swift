//
//  MainInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainViewInput: class {
	func setTableView()
	func tableViewReload()
	func setScrollAtTopButton()
	func navigationWithScrollAtTop()
	func navigationBarIsHidden(_ isHidden: Bool)
	func setupBalanceTitle()
	func setBalanceTitleWith(balance: String)
	func navigationTitleIsHidden(_ isHidden: Bool)
	func setupDimmView()
	func showDimmView(_ show: Bool)
	func tapOutSite()
	
}
