//
//  ExtensionChildrensControllersTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 18.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ExtensionChildrensControllersTest: XCTestCase {

	var viewController: UIViewController!
	var childController: UIViewController!

    override func setUpWithError() throws {
		viewController = UIViewController()
		childController = UIViewController()

    }

    override func tearDownWithError() throws {
		viewController = nil
		childController = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testAdd() {
		viewController.add(childController)

		XCTAssert(viewController.children.count == 1)
		XCTAssert(viewController.view.subviews.count == 1)
	}

	func testRemove() {
		childController.remove()
		XCTAssert(viewController.children.count == 0)
		XCTAssert(viewController.view.subviews.count == 0)
	}


}
