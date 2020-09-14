//
//  MainPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class MainPresenter {
	weak var view: MainViewInput!
	var interactor: MainInteractorInput!
	var router: MainRouterInput!
	var persons: [Person] = []

	init(view: MainViewInput) {
		self.view = view
	}

}
extension MainPresenter: MainViewOutput {
	func configureView() {
		view.setTableView()
		interactor.getContatcs { (persons) in
			self.persons = persons
			self.view.tableViewReload()
		}
		view.setScrollAtTopButton()
		view.navigationWithScrollAtTop()
		view.navigationBarIsHidden(true)
		view.setupBalanceTitle()
		view.setBalanceTitleWith(balance: getBalance())
	}
	func getBalance()-> String {
		if let balance = interactor.getBalance() {
			return balance
		} else {
			let balance = "100000"
			interactor.setBalance(balance: balance)
			return balance
		}
	}

	func countOfPersons()->Int {
		return persons.count
	}

	func getPerson(with indexPath: IndexPath)-> Person {
		return persons[indexPath.row]
	}

	func cardInfromationLeft(_ isLeft: Bool) {
		view.navigationBarIsHidden(isLeft)
	}

	func didChosePerson(indexPath: IndexPath) {
		view.navigationTitleIsHidden(true)
		router.pushContainer(with: persons[indexPath.row])
//		router.pushPeron(with: persons[indexPath.row])
	}

}

extension MainPresenter: MainInteractorOutput {
}

extension MainPresenter: MainMouduleInput {
	func statusTransaction(with balance: Balance?) {
		guard let router = router, let balance = balance else {return}
//		router.showSuccess(with: balance)
	}

	
}
