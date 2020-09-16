//
//  MainRouterInputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

@testable import MoneyTransfer

class MainRouterInputSpy: MainRouterInput {
	var didpPushContainer: Bool = false
	var didShowSuccess: Bool = false
	var didDissmisSucces: Bool = false

	func pushContainer(with person: Person) {
		didpPushContainer = true
	}

	func showSuccess(with balance: Balance) {
		didShowSuccess = true
	}

	func dissmisSucces() {
		didDissmisSucces = true
	}


}
