//
//  ContactPresenterTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 16.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class ContactPresenterTest: XCTestCase {

	var view: ContactViewInputSpy!
	var presenter: ContactPrsenter!

    override func setUpWithError() throws {
		view = ContactViewInputSpy()
		presenter = ContactPrsenter(view: view)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		view = nil
		presenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testConfigureView() {
		presenter.configureView()

		XCTAssert(view.didSetBackgroundColor)
		XCTAssert(view.didSetupAvatarImageView)
		XCTAssert(view.didSetupFullNameLabel)
		XCTAssert(view.didSetupPhoneNumberLabel)
		XCTAssert(view.didSetupRequestMoneyButton)
		XCTAssert(view.didSetupSendMoneyButton)
	}

	func testConfigure() {
		presenter.configure(with: Person(fullName: "asd", phoneNumber: "+789", avatarData: nil))

		XCTAssert(view.didSetDataToAvatar)
		XCTAssert(view.didSetFullName)
		XCTAssert(view.didSetPhoneNumber)
	}


}
