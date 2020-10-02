//
//  ContainerViewOutputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class ContainerViewOutputSpy: ContainerViewOutput {

	var didConfigureView: Bool = false
	var didTogleTransaction: Bool = false
	var didDissmis: Bool = false
	var didGetBalance: Bool = false
	var didShowStatus: Bool = false
	var didGesture: Bool = false
	var balance: BalanceOperation?
	var status: Bool = false

	func configureView() {
		didConfigureView = true
	}

	func togleTransaction(on vc: ChildsController?) {
		didTogleTransaction = true
	}

	func dissmis() {
		didDissmis = true
	}

	func getBalance() -> BalanceOperation? {
		didGetBalance = true
		return balance
	}

	func showStatus() -> Bool {
		didShowStatus = true
		return status
	}

	func gestureDidUse() {
		didGesture = true
	}

}
