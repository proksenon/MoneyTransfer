//
//  ContactConfiguratorTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ContactConfiguratorTests: XCTestCase {

	var viewController: ContactViewController!
	var configurator: ContactConfigurator!

    override func setUpWithError() throws {
		viewController = ContactViewController()
		configurator = ContactConfigurator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigure() {
		configurator.configure(with: viewController)

		XCTAssertNotNil(viewController.output)
		XCTAssertNotNil(viewController.moduleInput)
	}

}
