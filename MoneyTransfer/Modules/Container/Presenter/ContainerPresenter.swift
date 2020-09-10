//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
class ContainerPresenter {

	weak var view: ContainerViewInput?
	var interactor: ContainerInteractorInput?
	var router: ContainerRouterInput?
	var person: Person?
	var isShow: Bool = false

	init(view: ContainerViewInput) {
		self.view = view
	}

}

extension ContainerPresenter: ContainerViewOutput {
	func configureView() {
		guard let view = view, let person = person else { return }
		view.configureContactViewController(with: person)
		view.setupDimmView()
		view.tapOutSite()
	}

	func togleTransaction() {
		guard let view = view else { return }
		if !isShow {
			view.configureTransactionViewController()
		}
		isShow = !isShow
		view.showTransactionView(show: isShow, y: nil)
	}
	func moveTransaction(on viewSize: ViewSize) {
		guard let view = view else { return }
		view.showTransactionView(show: true, y: viewSize.size)
	}
}

extension ContainerPresenter: ContainerInteractorOutput {

}

extension ContainerPresenter: ContainerModuleInput {
	func configure(with person: Person) {
		self.person = person
	}
}
