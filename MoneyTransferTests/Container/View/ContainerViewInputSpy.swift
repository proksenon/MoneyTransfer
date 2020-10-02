//
//  ContainerViewInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
@testable import  MoneyTransfer

class ContainerViewInputSpy: ContainerViewInput {

	var didSetupDimmView: Bool = false
	var didTappedOutSite: Bool = false
	var didShowTransaction: Bool = false
	var didSetBackButton: Bool = false
	var didSetGesture: Bool = false
	var didmoveView: Bool = false

	func setupDimmView() {
		didSetupDimmView = true
	}

	func tapOutSite() {
		didTappedOutSite = true
	}

	func showTransaction(show: Bool, view: UIView, y: ViewSize?) {
		didShowTransaction = true
	}

	func setBackButton() {
		didSetBackButton = true
	}

	func setGesture(views: [UIView]) {
		didSetGesture = true
	}

	func moveView(with view: UIView) {
		didmoveView = true
	}


}
