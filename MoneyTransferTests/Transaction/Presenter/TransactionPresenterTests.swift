//
//  TransactionPresenterTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class TransactionPresenterTests: XCTestCase {

	var presenter: TransactionPresenter!
	var view: TransactionViewInputSpy!
	var interactor: TransactionInteractorInputSpy!
	var router: TransactionRouterInputSpy!
	let transaction = "200"

    override func setUpWithError() throws {
		view = TransactionViewInputSpy()
		presenter = TransactionPresenter(view: view)
		interactor = TransactionInteractorInputSpy()
		router = TransactionRouterInputSpy()
		presenter.interactor = interactor
		presenter.router = router
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		presenter = nil
		interactor = nil
		router = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigureView() {
		presenter.configureView()

		XCTAssert(view.didSetView)
		XCTAssert(view.didSetTargetOnOperationButton)
		XCTAssert(view.didSetupMoneyTextfield)
		XCTAssert(view.didSetupNotificationKeyboard)
	}

	func testCheckBalanceWithoutBalance() {
		presenter.checkBalance()

		XCTAssertFalse(view.didChangeCornerColorMoneyTextField)
		XCTAssertFalse(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithRequest() {
		presenter.configure(with: .request)
		interactor.balance = "100000"
		view.text = "100000"

		presenter.checkBalance()

		XCTAssert(view.didChangeCornerColorMoneyTextField)
		XCTAssert(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithTransaction() {
		presenter.configure(with: .transaction)
		interactor.balance = "100000"
		view.text = "100000"

		presenter.checkBalance()

		XCTAssert(view.didChangeCornerColorMoneyTextField)
		XCTAssert(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithTransactionFailure() {
		presenter.configure(with: .transaction)
		interactor.balance = "0"
		view.text = "0"

		presenter.checkBalance()

		XCTAssert(view.didChangeCornerColorMoneyTextField)
		XCTAssert(view.didOperationButtonIsEnabled)
	}

	func testGetBalance() {
		let balance = "100"
		interactor.balance = balance

		if let getBalance = presenter.getBalance() {
			XCTAssert(getBalance == balance)
		} else {
			XCTFail()
		}
		XCTAssert(interactor.didGetBalance)
	}

	func testSetNewBalanceWithFailure() {
		presenter.setNewBalance()

		XCTAssertFalse(interactor.didSetBalance)

		presenter.configure(with: .transaction)
		presenter.setNewBalance()

		XCTAssertFalse(interactor.didSetBalance)
	}

	func testSetNewBalanceWithSuccess() {
		interactor.balance = "1000"
		view.text = "1000"
		presenter.configure(with: .transaction)

		presenter.setNewBalance()

		XCTAssert(interactor.didSetBalance)
		XCTAssert(interactor.didGetBalance)

	}
	func testSetNewBalanceWhereOldBalanceIsZero() {
		interactor.balance = "0"
		presenter.configure(with: .transaction)

		presenter.setNewBalance()

		XCTAssertFalse(interactor.didSetBalance)
		XCTAssert(interactor.didGetBalance)

	}

	func testCheckTextFieldStringWithFailure() {
		let result = presenter.checkTextFieldString(text: "ss", string: "asda")

		XCTAssertFalse(result)
	}

	func testCheckTextFieldStringWithSuccess() {
		let result = presenter.checkTextFieldString(text: "2", string: "12312")

		XCTAssert(result)
	}

	func testCheckTextFieldStringWithDoubleZero() {
		let result = presenter.checkTextFieldString(text: "0", string: "0")

		XCTAssertFalse(result)
	}

	func testCheckTextFieldStringWith3SignAfterPoint() {
		let result = presenter.checkTextFieldString(text: "0", string: ",345")

		XCTAssertFalse(result)
	}


	func testConfigureCaseRequest() {
		presenter.configure(with: .request)

		XCTAssert(view.didSetTitleForOperationLabel)
		XCTAssert(view.didSetTitleForOperationButton)
	}

	func testConfigureCaseTransaction() {
		presenter.configure(with: .transaction)

		XCTAssert(view.didSetTitleForOperationLabel)
		XCTAssert(view.didSetTitleForOperationButton)
	}


}
