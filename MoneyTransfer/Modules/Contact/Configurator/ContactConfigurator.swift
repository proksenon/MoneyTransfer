//
//  ContactConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class ContactConfigurator: ContactConfiguratorProtocol {
	func configure(with viewController: ContactViewController){
		let presenter = ContactPrsenter(view: viewController)
		let interactor = ContactInteractor(output: presenter)
		let router = ContactRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router
	}
	
}
