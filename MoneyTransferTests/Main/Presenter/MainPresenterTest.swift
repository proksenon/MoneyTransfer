//
//  MainPresenterTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest

@testable import MoneyTransfer

class MainPresenterTest: XCTestCase {

	var presenter: MainPresenter!
	var view: MainViewInputSpy!
	var router: MainRouterInputSpy!
	var interactor: MainInteractorInputSpy!

    override func setUpWithError() throws {
		view = MainViewInputSpy()
		router = MainRouterInputSpy()
		interactor = MainInteractorInputSpy()
		presenter = MainPresenter(view: view)
		presenter.interactor = interactor
		presenter.router = router
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		router = nil
		interactor = nil
		presenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigureView() {
		presenter.configureView()

		XCTAssertTrue(view.didScrollAtTopButton)
		XCTAssertTrue(view.didNavigationWithScrollAtTop)
		XCTAssertTrue(view.didSetBalanceTitleWith)
		XCTAssertTrue(view.didSetTapOutSite)
		XCTAssertTrue(view.didHiddenNavigationBar)
		XCTAssertTrue(interactor.didGetContacts)
	}

	func testGetBalanceFromServices() {
		let currentBalance = "5000"
		interactor.balance = currentBalance

		let balance = presenter.balance()

		XCTAssertTrue(interactor.didGetBalance)
		XCTAssert(currentBalance == balance)
	}

	func testGetBBalanceForFirstTime() {
		let balance = presenter.balance()

		XCTAssertEqual(balance, "100000.00")
		XCTAssertTrue(interactor.didSetBalance)
	}

	func testCountOfPersons() {
		let persons: [Person] = [Person(fullName: "Orange", phoneNumber: "+79999", avatarData: nil),
								 Person(fullName: "Apple", phoneNumber: "+1", avatarData: nil)]
		interactor.persons = persons
		presenter.configureView()

		let countOfpersons = presenter.countOfPersons()

		XCTAssert(persons.count == countOfpersons)
	}

	func testGetPerson() {
		let indexPath = IndexPath(row: 1, section: 0)
		let persons: [Person] = [Person(fullName: "Orange", phoneNumber: "+79999", avatarData: nil),
								 Person(fullName: "Apple", phoneNumber: "+1", avatarData: nil)]
		interactor.persons = persons
		presenter.configureView()

		let person = presenter.getPerson(with: indexPath)

		XCTAssert(persons[indexPath.row] == person)
	}

	func testCardLeft() {
		presenter.cardInfromationLeft(true)

		XCTAssert(view.didHiddenNavigationBar)
	}

	func testDidChosePerson() {
		let indexPath = IndexPath(row: 1, section: 0)
		let persons: [Person] = [Person(fullName: "Orange", phoneNumber: "+79999", avatarData: nil),
								 Person(fullName: "Apple", phoneNumber: "+1", avatarData: nil)]
		interactor.persons = persons
		presenter.configureView()

		presenter.didChosePerson(indexPath: indexPath)

		XCTAssert(view.didHiddenNavigationTitle)
		XCTAssert(router.didpPushContainer)
	}

	func testDissmisStatusOperation() {
		presenter.dissmissStatusOperation()

		XCTAssert(router.didDissmisSucces)
		XCTAssert(view.didShowDimmView)
	}

	func testStatusTransactionWithTrue() {
		let balance = Balance(balance: "100000", transactionMoney: "1000")
		let expectation = self.expectation(description: #function)
		presenter.statusTransaction(with: balance, show: true)

		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			XCTAssert(self.view.didShowDimmView)
			XCTAssert(self.router.didShowSuccess)
			XCTAssert(self.view.didTableViewReload)
			XCTAssert(self.view.didSetBalanceTitleWith)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5)
	}
}
