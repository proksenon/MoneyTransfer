//
//  NameViewInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

protocol ContainerViewInput: class {
	func configureContactViewController(with person: Person)
	func configureTransactionViewController()
	func setupDimmView()
	func tapOutSite()
	func dimmViewIsHidden(_ isShow: Bool)
	func showTransactionView(show: Bool, y: CGFloat?)
}
