//
//  MainViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

@testable import MoneyTransfer

class MainViewInputSpy: MainViewInput {

	var didSetupTable: Bool = false
	var didTableViewReload: Bool = false
	var didScrollAtTopButton: Bool = false
	var didNavigationWithScrollAtTop: Bool = false
	var didHiddenNavigationBar: Bool = false
	var didSetBalanceTitle: Bool = false
	var didSetBalanceTitleWith: Bool = false
	var didHiddenNavigationTitle: Bool = false
	var didShowDimmView: Bool = false
	var didSetTapOutSite: Bool = false
	


	func setupTableView() {
		didSetupTable = true
	}

	func tableViewReload() {
		didTableViewReload = true
	}

	func setScrollAtTopButton() {
		didScrollAtTopButton = true
	}

	func navigationWithScrollAtTop() {
		didNavigationWithScrollAtTop = true
	}

	func navigationBarIsHidden(_ isHidden: Bool) {
		didHiddenNavigationBar = true
	}

	func setupBalanceTitle() {
		didSetBalanceTitle = true
	}

	func setBalanceTitleWith(balance: String) {
		didSetBalanceTitleWith = true
	}

	func navigationTitleIsHidden(_ isHidden: Bool) {
		didHiddenNavigationTitle = true
	}

	func showDimmView(_ show: Bool) {
		didShowDimmView = true
	}

	func tapOutSite() {
		didSetTapOutSite = true
	}
}

