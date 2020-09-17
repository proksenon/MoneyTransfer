//
//  TransactionViewControllerTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class TransactionViewControllerTests: XCTestCase {

	var output: TransactionViewOutputSpy!
	var viewController: TransactionViewController!
	var configurator: TransactionConfiguratorMock!

    override func setUpWithError() throws {
		output = TransactionViewOutputSpy()
		viewController = TransactionViewController()
		configurator = TransactionConfiguratorMock(output: output)
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

		XCTAssert(output.didConfigureView)
	}

	func testSetView() {
		viewController.setView()

		XCTAssert(viewController.view.backgroundColor == .white)
	}

	func testTextFieldDidChange() {
		let textField = UITextField()

		viewController.textFieldDidChangeSelection(textField)

		XCTAssert(output.didCheckBalance)
		XCTAssert(output.didCheckedExcessSymbols)
	}

	func testTextFieldSchouldChangeCharacters() {
		let textField = UITextField()

		viewController.textField(textField, shouldChangeCharactersIn: NSRange.init(), replacementString: "2123")

		XCTAssert(output.didCheckedTextFieldString)
	}

}
