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

	func setupDimmView() {
		didSetupDimmView = true
	}

	func tapOutSite() {
		didTappedOutSite = true
	}

	func showTransaction(show: Bool, showViewController: UIViewController, y: ViewSize?) {
		didShowTransaction = true
	}


}
