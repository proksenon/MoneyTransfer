//
//  TreatmentViewControllerTest.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 17.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import XCTest
@testable import MoneyTransfer

class TreatmentViewControllerTest: XCTestCase {

	var configurator: TreatmentConfiguratorMock!
	var viewController: TreatmentViewController!
	var output: TreatmentViewOutputSpy!

    override func setUpWithError() throws {
		output = TreatmentViewOutputSpy()
		viewController = TreatmentViewController()
		configurator = TreatmentConfiguratorMock(output: output)
		configurator.configure(with: viewController)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
		output = nil
		viewController = nil
		configurator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testViewDidLoad() {
		viewController.viewDidLoad()

		XCTAssert(output.didConfigureView)
	}

}
