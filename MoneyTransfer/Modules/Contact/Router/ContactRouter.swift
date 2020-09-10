//
//  ContactRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class ContactRouter: ContactRouterInput {
	weak var viewController: UIViewController?

	init(viewController: ContactViewController) {
		self.viewController = viewController
	}

	func pushTransaction() {
		let transactionViewController = TransactionViewController()
		let	transactionConfigurator = TransactionConfigurator()
		transactionConfigurator.configure(with: transactionViewController)
		guard let viewController = viewController as? ContactViewController else { return }
//		transactionViewController.moduleOutput = viewController.moduleInput


		viewController.addChild(transactionViewController)
		viewController.view.addSubview(transactionViewController.view)
		transactionViewController.didMove(toParent: viewController)
		transactionViewController.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([transactionViewController.view.topAnchor.constraint(equalTo: viewController.view.centerYAnchor, constant: UIScreen.main.bounds.size.height/5),
									 transactionViewController.view.leftAnchor.constraint(equalTo: viewController.view.leftAnchor),
									 transactionViewController.view.rightAnchor.constraint(equalTo: viewController.view.rightAnchor),
									 transactionViewController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)])

	}
}
