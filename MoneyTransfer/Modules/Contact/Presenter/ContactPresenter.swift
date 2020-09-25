//
//  ContactPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class ContactPrsenter {

	weak var view: ContactViewInput?
	var interactor: ContactInteractorInput?
	var router: ContactRouterInput?
	private var person: Person?

	init(view: ContactViewInput) {
		self.view = view
	}
}
//MARK: -ContactViewOutput
extension ContactPrsenter: ContactViewOutput {
	func configureView() {
		guard let view = view else { return }
		view.setViewColor()
		view.setTargetRequestMoneyButton()
		view.setTargetOnSendMoneyButton()
	}

}
//MARK: -ContactInteractorOutput
extension ContactPrsenter: ContactInteractorOutput {
	
}
//MARK: -ContactModuleInput
extension ContactPrsenter: ContactModuleInput {
	func configure(with person: Person) {
		guard let view = view else { return }
		view.setDataToAvatar(with: person.avatarData)
		view.setFullName(with: person.fullName ?? Labels.unknown)
		view.setPhoneNumber(with: person.phoneNumber ?? Labels.withoutPhone)
	}

}
