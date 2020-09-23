//
//  TreatmentPresenterTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class TreatmentPresenterTests: XCTestCase {

	var view: TreatmentViewInputSpy!
	var interactor: TreatmentInteractorInputSpy!
	var router: TreatmentRouterInputSpy!
	var presenter: TreatmentPresenter!

    override func setUpWithError() throws {
		view = TreatmentViewInputSpy()
		interactor = TreatmentInteractorInputSpy()
		router = TreatmentRouterInputSpy()
		presenter = TreatmentPresenter(view: view)
		presenter.router = router
		presenter.interactor = interactor
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		interactor = nil
		router = nil
		presenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigureViewWithOutAmountOfMoney() {
		presenter.configureView()

		XCTAssert(view.didSetView)
		XCTAssert(view.didSetTargetOnOperationButton)
		XCTAssertFalse(view.didSetTitleAmountOfMoneyLabel)
	}

	func testConfigureViewWithAmountOfMoney() {
		presenter.configure(amountOfTransaction: "1000", operation: .request)
		presenter.configureView()

		XCTAssert(view.didSetView)
		XCTAssert(view.didSetTargetOnOperationButton)
		XCTAssert(view.didSetTitleAmountOfMoneyLabel)
	}

	func testConfigureWithRequest() {
		presenter.configure(amountOfTransaction: "100", operation: .request)

		XCTAssert(view.didSetTitleForStatusLabel)
	}

	func testConfigureWithTransaction() {
		presenter.configure(amountOfTransaction: "100", operation: .transaction)

		XCTAssert(view.didSetTitleForStatusLabel)
	}

}
