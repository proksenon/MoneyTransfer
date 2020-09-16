//
//  MainViewOutputSpy.swift
//  MoneyTransferTests
//
//  Created by 18579132 on 15.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
@testable import MoneyTransfer

class MainViewOutPutSpy: MainViewOutput {

	var didConfigure: Bool = false
	var didCount: Bool = false
	var count: Int?
	var didGetPerson: Bool = false
	var person: Person?
	var didCardLeave: Bool = false
	var didChooseCell: Bool = false
	var didGetBalance: Bool = false
	var balance: String?
	var didDissmiss: Bool = false

	func configureView() {
		didConfigure = true
	}

	func countOfPersons() -> Int {
		didCount = true
		guard let count = count else { return 0}
		return count
	}

	func getPerson(with indexPath: IndexPath) -> Person {
		didGetPerson = true
		guard let person = person else { return Person(fullName: nil, phoneNumber: nil, avatarData: nil)}
		return person
	}

	func cardInfromationLeft(_ isLeft: Bool) {
		didCardLeave = true
	}

	func didChosePerson(indexPath: IndexPath) {
		didChooseCell = true
	}

	func getBalance() -> String {
		didGetBalance = true
		guard let balance = balance else { return "bad balance"}
		return balance
	}

	func dissmissStatusOperation() {
		didDissmiss = true
	}


}
