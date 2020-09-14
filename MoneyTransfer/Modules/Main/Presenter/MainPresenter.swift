//
//  MainPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class MainPresenter {
	
	weak var view: MainViewInput!
	var interactor: MainInteractorInput!
	var router: MainRouterInput!
	private var persons: [Person] = []

	init(view: MainViewInput) {
		self.view = view
	}

}
//MARK: -MainViewOutput
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
		view.setupDimmView()
		view.tapOutSite()
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
	}

	func dissmissStatusOperation() {
		router.dissmisSucces()
		view.showDimmView(false)
	}

}
//MARK: -MainInteractorOutput
extension MainPresenter: MainInteractorOutput {
}
//MARK: -MainMouduleInput
extension MainPresenter: MainMouduleInput {
	
	func statusTransaction(with balance: Balance?, show: Bool) {
		guard let router = router, let balance = balance else {return}
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			if show {
				self.view.showDimmView(true)
				router.showSuccess(with: balance)
			}
			self.view.tableViewReload()
			self.view.setBalanceTitleWith(balance: self.getBalance())
		}
	}
}
