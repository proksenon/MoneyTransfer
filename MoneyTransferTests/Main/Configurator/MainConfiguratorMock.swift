//
//  MainConfiguratorMock.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class MainConfiguratorMock: MainConfiguratorProtocol {

	var output: MainViewOutPutSpy

	init(output: MainViewOutPutSpy = MainViewOutPutSpy()) {
		self.output = output
	}

	func configure(with viewController: MainViewController) {
		viewController.output = output
	}
}
