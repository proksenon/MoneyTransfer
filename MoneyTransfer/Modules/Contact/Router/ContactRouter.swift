//
//  ContactRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Роутер модуля Contact
final class ContactRouter: ContactRouterInput {
	weak var viewController: UIViewController?

	init(viewController: ContactViewController) {
		self.viewController = viewController
	}

}
