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
		XCTAssert(view.didSetupNameOperationLabel)
		XCTAssert(view.didSetupMoneyTextfield)
		XCTAssert(view.didSetupOperationButton)
		XCTAssert(view.didSetupNotificationKeyboard)
	}

	func testCheckBalanceWithoutBalance() {
		presenter.checkBalance(transaction: transaction)

		XCTAssertFalse(view.didChangeCornerColorMoneyTextField)
		XCTAssertFalse(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithRequest() {
		presenter.configure(with: .request)
		interactor.balance = "100000"

		presenter.checkBalance(transaction: transaction)

		XCTAssert(view.didChangeCornerColorMoneyTextField)
		XCTAssert(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithTransaction() {
		presenter.configure(with: .transaction)
		interactor.balance = "100000"

		presenter.checkBalance(transaction: transaction)

		XCTAssert(view.didChangeCornerColorMoneyTextField)
		XCTAssert(view.didOperationButtonIsEnabled)
	}

	func testCheckBalanceWithTransactionFailure() {
		presenter.configure(with: .transaction)
		interactor.balance = "0"

		presenter.checkBalance(transaction: transaction)

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
		presenter.setNewBalance(transaction: transaction)

		XCTAssertFalse(interactor.didSetBalance)

		presenter.configure(with: .transaction)
		presenter.setNewBalance(transaction: transaction)

		XCTAssertFalse(interactor.didSetBalance)
	}

	func testSetNewBalanceWithSuccess() {
		interactor.balance = "1000"
		presenter.configure(with: .transaction)

		presenter.setNewBalance(transaction: transaction)

		XCTAssert(interactor.didSetBalance)
		XCTAssert(interactor.didGetBalance)

	}
	func testSetNewBalanceWhereOldBalanceIsZero() {
		interactor.balance = "0"
		presenter.configure(with: .transaction)

		presenter.setNewBalance(transaction: transaction)

		XCTAssertFalse(interactor.didSetBalance)
		XCTAssert(interactor.didGetBalance)

	}

	func testCheckTextFieldStringWithFailure() {
		let result = presenter.checkTextFieldString(string: "asda")

		XCTAssertFalse(result)
	}

	func testCheckTextFieldStringWithSuccess() {
		let result = presenter.checkTextFieldString(string: "12312")

		XCTAssert(result)
	}

	func testCheckExcessSymbolsWithNil() {
		let result = presenter.checkExcessSymbols(text: nil)

		XCTAssertNil(result)
	}

	func testCheckExcessSymbolsWithEmpty() {
		let result = presenter.checkExcessSymbols(text: "")

		XCTAssert(result == "")
	}

	func testCheckExcessSymbolsWithFirstZero() {
		let result = presenter.checkExcessSymbols(text: "012")

		XCTAssert(result == "12")
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
