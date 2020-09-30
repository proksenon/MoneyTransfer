//
//  MainPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Презентер модуля Main
final class MainPresenter {
	
	weak var view: MainViewInput?
	var interactor: MainInteractorInput?
	var router: MainRouterInput?
	var mainTableDataSource: MainTableDataSource?
	var mainTableDelegate: MainTableDelegate?
	private var persons: [Person] = []

	init(view: MainViewInput) {
		self.view = view
	}

}
//MARK: -MainViewOutput
extension MainPresenter: MainViewOutput {

	func configureView() {
		guard let view = view, let interactor = interactor else { return }
		interactor.getContatcs { (persons) in
			self.persons = persons
			view.tableViewReload()
		}
		view.setScrollAtTopButton()
		view.navigationWithScrollAtTop()
		view.navigationBarIsHidden(true)
		view.setBalanceTitleWith(balance: balance().balance)
		view.tapOutSite()
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

//MARK: -MainTableDelegateOutput
extension MainPresenter: MainTableDelegateOutput {

	func cardInfromationLeft(_ isLeft: Bool) {
		guard let view = view else { return }
		view.navigationBarIsHidden(isLeft)
	}

	func didChosePerson(indexPath: IndexPath) {
		guard let view = view, let router = router else { return }
		view.navigationTitleIsHidden(true)
		router.pushContainer(with: persons[indexPath.row])
	}

}

//MARK: -MainTableDataSourceOutput
extension MainPresenter: MainTableDataSourceOutput {

	func countOfPersons()->Int {
		return persons.count
	}

	/// Функция получает IndexPath и возвращает по данному индексу структуру Person
	/// - Parameter indexPath: IndexPath
	/// - Returns: Структуру Person контакта человека
	private func person(with indexPath: IndexPath)-> Person {
		return persons[indexPath.row]
	}

	/// Если баланс небыл установлен возвращает начальный баланс
	/// - Returns: Баланс человека
	private func balance()-> Balance {
		guard let interactor = interactor else { return Balance(balance: DefaultBalance.failBalance) }
		if let balance = interactor.balance {
			return Balance(balance: balance)
		} else {
			let balance = DefaultBalance.startBalance
			interactor.balance = balance
			return Balance(balance: balance)
		}
	}

	func itemCell(with indexPath: IndexPath)-> CellItemProtocol {
		if indexPath.section == 1 {
			return person(with: indexPath)
		} else {
			return balance()
		}
	}
}

//MARK: -MainMouduleInput
extension MainPresenter: MainMouduleInput {
	
	func statusTransaction(with balance: BalanceOperation?, show: Bool) {
		guard let router = router, let balance = balance, let view = view else {return}
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			if show {
				view.showDimmView(true)
				router.showSuccess(with: balance)
			}
			view.tableViewReload()
			view.setBalanceTitleWith(balance: self.balance().balance)
		}
	}
}
