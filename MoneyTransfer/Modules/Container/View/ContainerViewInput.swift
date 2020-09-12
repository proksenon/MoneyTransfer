//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol ContainerViewInput: class {
//	func configureContactViewController(with person: Person)
//	func configureTransactionViewController()
//	func configureTreatmentViewController(amountOfTransaction: String)
	func setupDimmView()
	func tapOutSite()
	func dimmViewIsHidden(_ isShow: Bool)
	func showTransactionView(show: Bool, y: CGFloat?, showVC: ChildsController)
	func showTreatmentView(show: Bool, y: CGFloat?)
	func setPersonAtContactView(with person: Person)
	func setAmountAtTreatmentController(with amount: String)
	func setDataAtSuccesViewController(with balance: Balance)
}
