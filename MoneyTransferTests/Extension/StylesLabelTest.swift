//
//  StylesLabelTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 18.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class StylesLabelTest: XCTestCase {

	var label: UILabel!

    override func setUpWithError() throws {
		label = UILabel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		label = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testSubLabel() {
		let title = "title"
		label.subLabel(title: title)

		XCTAssert(label.backgroundColor == .clear)
		XCTAssert(label.textColor == .gray)
		XCTAssert(label.text == title)
	}
	func testMainLabel() {
		let title = "title"
		label.mainLabel(title: title)

		XCTAssert(label.backgroundColor == .clear)
		XCTAssert(label.textColor == .black)
		XCTAssert(label.text == title)
	}
}
