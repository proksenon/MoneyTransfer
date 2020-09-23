//
//  SuccessPresenterTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class SuccessPresenterTests: XCTestCase {

	var view: SuccessViewInputSpy!
	var presenter: SuccessOperationPresenter!

    override func setUpWithError() throws {
		view = SuccessViewInputSpy()
		presenter = SuccessOperationPresenter(view: view)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		presenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigureView() {
		presenter.configureView()

		XCTAssert(view.didSetView)
		XCTAssert(view.didSetTargetOnOperationButton)
	}

	func testConfigure() {
		let balance: Balance = Balance(balance: "1000", transactionMoney: "200")
		presenter.configure(with: balance)

		XCTAssert(view.didSetTitleAmountOfMoneyLable)
		XCTAssert(view.didSetOldBalance)
		XCTAssert(view.didSetCurrentBalance)
	}

}
