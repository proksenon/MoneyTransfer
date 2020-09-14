//
//  MainRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 07.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class MainRouter: MainRouterInput {

	weak var viewController: UIViewController?
	private var successViewController: SuccessOperationViewController?

	init(viewController: MainViewController) {
		self.viewController = viewController
	}

	func pushContainer(with person: Person) {
		guard let viewController = viewController else { return }
		let containerVC = ContainerViewController()
		let containerConfigurator = ContainerConfigurator()
		containerConfigurator.configure(with: containerVC)
		containerVC.moduleOutput = (viewController as? MainViewController)?.moduleInput
		containerVC.moduleInput?.configure(with: person)
		viewController.navigationController?.pushViewController(containerVC, animated: true)
	}

	func showSuccess(with balance: Balance){
		guard let viewController = viewController else { return }
		let successViewController = SuccessOperationViewController()
		let successConfigurator = SuccessOperationConfigurator()
		successConfigurator.configure(with: successViewController)
		successViewController.moduleOutput = viewController as? ExitDelegate
		successViewController.view.frame.origin.y = viewController.view.frame.height/3
		viewController.add(successViewController)
		successViewController.moduleInput?.configure(with: balance)
		self.successViewController = successViewController
	}
	
	func dissmisSucces() {
		successViewController?.remove()
	}
}
