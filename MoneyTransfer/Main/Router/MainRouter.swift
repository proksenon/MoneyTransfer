//
//  MainRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class MainRouter: MainRouterInput {

	weak var viewController: UIViewController?

	init(viewController: MainViewController) {
		self.viewController = viewController
	}

	func pushPeron(with person: Person) {
		guard let viewController = viewController else { return }
		let contactViewController = ContactViewController()
		let contactConfigurator = ContactConfigurator()
		contactConfigurator.configure(with: contactViewController)
		contactViewController.moduleInput?.configure(with: person)
		viewController.navigationController?.pushViewController(contactViewController, animated: true)
	}
	func pushContainer(with person: Person) {
		guard let viewController = viewController else { return }
		let containerVC = ContainerViewController()
		containerVC.configureContactViewController(with: person)
		viewController.navigationController?.pushViewController(containerVC, animated: true)
	}
}
