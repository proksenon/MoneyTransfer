//
//  ContainerViewControllerTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ContainerViewControllerTests: XCTestCase {

	var moduleOutput: MainModuleInputSpy!
	var viewController: ContainerViewController!
	var output: ContainerViewOutputSpy!
	var configurator: ContainerConfiguratorMock!

    override func setUpWithError() throws {
		moduleOutput = MainModuleInputSpy()
		viewController = ContainerViewController()
		output = ContainerViewOutputSpy()
		configurator = ContainerConfiguratorMock(output: output)
		configurator.configure(with: viewController)
		viewController.moduleOutput = moduleOutput
    }

    override func tearDownWithError() throws {
		moduleOutput = nil
		viewController = nil
		output = nil
		configurator = nil
    }

	func testViewDidLoad() {
		viewController.viewDidLoad()

		XCTAssert(output.didConfigureView)
	}

	func testViewDidDisappear() {
		viewController.viewDidDisappear(true)

		XCTAssert(moduleOutput.status)
	}
}
