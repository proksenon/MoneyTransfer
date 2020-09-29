//
//  MainInteractorTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class MainInteractorTests: XCTestCase {

	var interactor: MainInteractor!
	var output: MainInteractorOutputSpy!
	var contactsManager: ContactsManagerMock!
	var userDefaultsWork: UserDefaultsWorkMock!

    override func setUpWithError() throws {
		output = MainInteractorOutputSpy()
		contactsManager = ContactsManagerMock()
		userDefaultsWork = UserDefaultsWorkMock()
		interactor = MainInteractor(presenter: output, contactsManager: contactsManager, userDefaultsWork: userDefaultsWork)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		output = nil
		contactsManager = nil
		userDefaultsWork = nil
		interactor = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testGetContacts() {

		let currentPersons: [Person] = [Person(fullName: "Orange", phoneNumber: "+79999", avatarData: nil),
								 Person(fullName: "Apple", phoneNumber: "+1", avatarData: nil)]
		var result = [Person]()
		let expectation = self.expectation(description: #function)
		contactsManager.persons =  currentPersons

		interactor.getContatcs { (persons) in
			result = persons
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5)
		XCTAssert(currentPersons == result)
	}

	func testGetBalance() {
		let currentBalance = "1000"
		userDefaultsWork.object = currentBalance

		let balance = interactor.balance

		XCTAssert(currentBalance == balance)
	}

	func testSetBalance() {
		interactor.balance = ""

		XCTAssert(userDefaultsWork.didSet)
	}
}
