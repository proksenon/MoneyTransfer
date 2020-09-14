//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol ContainerViewInput: class {
	func setupDimmView()
	func tapOutSite()
	func showTransactionView(show: Bool, y: CGFloat?, showVC: ChildsController)
	func setPersonAtContactView(with person: Person)
	func setAmountAtTreatmentController(with amount: String, operation: Operations)
	func setDataAtSuccesViewController(with balance: Balance)
	func setOperationAtTransactionView(operation: Operations)
}
