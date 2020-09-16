//
//  MainViewControllerTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class MainViewControllerTest: XCTestCase {

	var viewController: MainViewController!
	var output: MainViewOutPutSpy!
	var configurator: MainConfiguratorMock!

    override func setUpWithError() throws {
		output = MainViewOutPutSpy()
		configurator = MainConfiguratorMock(output: output)
		viewController = MainViewController(configurator: configurator)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		viewController = nil
		output = nil
		configurator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testViewDidLoad() {
		viewController.viewDidLoad()

		XCTAssertTrue(output.didConfigure, "Didnt configure MainView")
	}


	func testBackToContacts() {
		viewController.viewDidLoad()
		viewController.backToContacts()

		XCTAssert(output.didDissmiss, "didnt dissmis")
	}

}
