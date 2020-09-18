//
//  ContainerPresenterTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ContainerPresenterTests: XCTestCase {

	var view: ContainerViewInputSpy!
	var presenter: ContainerPresenter!
	var router: ContainerRouterInputSpy!
	var contactViewController: ContactViewController!
	var contactModuleInput: ContactModuleInputSpy!
	var transactionViewController: TransactionViewController!
	var transactionModuleInput: TransactionModuleInputSpy!
	var treatmentViewController: TreatmentViewController!
	var treatmentModuleInput: TreatmentModuleInputSpy!
	var successOperationViewController: SuccessOperationViewController!
	var successModuleInput: SuccessModuleInputSpy!


    override func setUpWithError() throws {
		view = ContainerViewInputSpy()
		presenter = ContainerPresenter(view: view)
		router = ContainerRouterInputSpy()
		contactViewController = ContactViewController()
		contactModuleInput = ContactModuleInputSpy()
		contactViewController.moduleInput = contactModuleInput
		transactionViewController = TransactionViewController()
		transactionModuleInput = TransactionModuleInputSpy()
		transactionViewController.moduleInput = transactionModuleInput
		treatmentViewController = TreatmentViewController()
		treatmentModuleInput = TreatmentModuleInputSpy()
		treatmentViewController.moduleInput = treatmentModuleInput
		successOperationViewController = SuccessOperationViewController()
		successModuleInput = SuccessModuleInputSpy()
		successOperationViewController.moduleInput = successModuleInput
		presenter.router = router
		presenter.contactViewController = contactViewController
		presenter.treatmentViewController = treatmentViewController
		presenter.successOperationViewController = successOperationViewController
		presenter.transactionViewController = transactionViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		presenter = nil
		router = nil
		contactViewController = nil
		contactModuleInput = nil
		transactionViewController = nil
		transactionModuleInput = nil
		treatmentViewController = nil
		treatmentModuleInput = nil
		successOperationViewController = nil
		successModuleInput = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testTogleTransactionWithoutSwicth() {
		presenter.chooseOperation(operation: .request)

		presenter.togleTransaction(on: .successOperationViewController)

		XCTAssertFalse(view.didShowTransaction)
	}

	func testTogleTransactionWithOutClosingVC() {
		presenter.chooseOperation(operation: .request)

		presenter.togleTransaction(on: .transactionViewController)

		XCTAssert(view.didShowTransaction)
	}

	func testTogleTransactionWithClosingVC() {
		presenter.chooseOperation(operation: .request)
		presenter.togleTransaction(on: .transactionViewController)
		view.didShowTransaction = false

		presenter.togleTransaction(on: .treatmentViewController)

		XCTAssert(view.didShowTransaction)
	}

	func testTogleTransactionSuccesWithClosingVC() {
		presenter.chooseOperation(operation: .transaction)
		presenter.togleTransaction(on: .treatmentViewController)
		view.didShowTransaction = false

		presenter.togleTransaction(on: .successOperationViewController)

		XCTAssert(view.didShowTransaction)
	}

	func testSuccesOperation() {
		let expectation = self.expectation(description: #function)
		presenter.chooseOperation(operation: .transaction)

		presenter.togleTransaction(on: .treatmentViewController)

		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			XCTAssert(self.view.didShowTransaction)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 7)
	}

	func testGetBalance() {
		let currentBalance = "1000"
		presenter.chooseOperation(operation: .transaction)
		presenter.transactionMoney(amount: "200")
		presenter.balance(balance: currentBalance)


		if let balance = presenter.getBalance() {
			XCTAssert(balance.balance == currentBalance)
		} else {
			XCTFail()
		}
	}

	func testSetBalance() {
		let currentBalance = "1000"
		presenter.chooseOperation(operation: .transaction)
		presenter.transactionMoney(amount: "200")

		presenter.balance(balance: currentBalance)

		XCTAssert(successModuleInput.didConfigure)
	}

	func testShowStatusTrue() {
		let result = presenter.showStatus()

		XCTAssert(result)
	}

	func testShowStatusFalse() {
		presenter.chooseOperation(operation: .request)

		let result = presenter.showStatus()

		XCTAssertFalse(result)
	}

	func testConfigure() {
		presenter.configure(with: Person(fullName: "aa", phoneNumber: "aa", avatarData: nil))

		XCTAssert(view.didSetupDimmView)
		XCTAssert(view.didTappedOutSite)
		XCTAssert(contactModuleInput.didConfigure)
	}

	func testTogleTransaction() {
		presenter.togleTransaction(on: nil)

		XCTAssertFalse(view.didShowTransaction)
	}

	func testMoveTransaction() {
		presenter.chooseOperation(operation: .transaction)
		presenter.togleTransaction(on: .treatmentViewController)
		view.didShowTransaction = false

		presenter.moveTransactionView(on: ViewSize(size: 10))

		XCTAssert(view.didShowTransaction)
	}

	func testTransactionMoney() {
		presenter.chooseOperation(operation: .request)

		presenter.transactionMoney(amount: "200")

		XCTAssert(treatmentModuleInput.didConfigure)
	}

	func testBalance() {
		presenter.chooseOperation(operation: .request)
		presenter.transactionMoney(amount: "200")

		presenter.balance(balance: "1000")

		XCTAssert(successModuleInput.didConfigure)
	}

	func testBackToContact() {
		presenter.backToContacts()

		XCTAssert(router.didDissmis)
	}
}
