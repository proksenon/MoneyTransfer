//
//  MainPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class MainPresenter {
	
	weak var view: MainViewInput?
	var interactor: MainInteractorInput?
	var router: MainRouterInput?
	private var persons: [Person] = []

	init(view: MainViewInput) {
		self.view = view
	}

}
//MARK: -MainViewOutput
extension MainPresenter: MainViewOutput {

	func configureView() {
		guard let view = view, let interactor = interactor else { return }
		view.setTableView()
		interactor.getContatcs { (persons) in
			self.persons = persons
			view.tableViewReload()
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
		guard let interactor = interactor else { return "0"}
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
		guard let view = view else { return }
		view.navigationBarIsHidden(isLeft)
	}

	func didChosePerson(indexPath: IndexPath) {
		guard let view = view, let router = router else { return }
		view.navigationTitleIsHidden(true)
		router.pushContainer(with: persons[indexPath.row])
	}

	func dissmissStatusOperation() {
		guard let view = view, let router = router else { return }
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
		guard let router = router, let balance = balance, let view = view else {return}
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			if show {
				view.showDimmView(true)
				router.showSuccess(with: balance)
			}
			view.tableViewReload()
			view.setBalanceTitleWith(balance: self.getBalance())
		}
	}
}
