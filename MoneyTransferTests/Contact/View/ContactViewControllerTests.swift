//
//  ContactViewControllerTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ContactViewControllerTests: XCTestCase {

	var output: ContactViewOutputSpy!
	var configurator: ContactConfiguratorMock!
	var viewController: ContactViewController!

    override func setUpWithError() throws {
		output = ContactViewOutputSpy()
		viewController = ContactViewController()
		configurator = ContactConfiguratorMock(output: output)
		configurator.configure(with: viewController)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		output = nil
		viewController = nil
		configurator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testViewDidLoad() {
		viewController.viewDidLoad()

		XCTAssert(output.didconfigureView)
	}

	func testSetBackground() {
		viewController.setBackgroundColor()

		XCTAssert(viewController.view.backgroundColor == UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
	}

	func testSetupAvatarImageView() {
		let countSubviews = viewController.view.subviews.count
		viewController.setupAvatarImageView()

		XCTAssert(viewController.view.subviews.count == countSubviews + 1)
	}

	
}
