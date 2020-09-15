//
//  TreatmentTransactionRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class ContainerRouter: ContainerRouterInput {

	weak var viewController: UIViewController?

	init(viewController: UIViewController) {
		self.viewController = viewController
	}

	func dissmis() {
		viewController?.navigationController?.popViewController(animated: true)
	}
}
