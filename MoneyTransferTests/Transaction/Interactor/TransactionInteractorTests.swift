//
//  TransactionInteractorTests.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class TransactionInteractorTests: XCTestCase {

	var output: TransactionInteractorOutputSpy!
	var interactor: TransactionInteractor!
	var userDefaultsWork: UserDefaultsWorkMock!

    override func setUpWithError() throws {
		output = TransactionInteractorOutputSpy()
		userDefaultsWork = UserDefaultsWorkMock()
		interactor = TransactionInteractor(output: output, userDefaultsWork: userDefaultsWork)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		output = nil
		userDefaultsWork = nil
		interactor = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testGetBalance() {
		let balance = "1000"
		userDefaultsWork.object = balance

		if let result = interactor.getBalance() {
			XCTAssert(result == balance)
		} else {
			XCTFail()
		}
	}

	func testSetBalance() {
		interactor.setBalance(balance: "1000")

		XCTAssert(userDefaultsWork.didSet)
	}
}
