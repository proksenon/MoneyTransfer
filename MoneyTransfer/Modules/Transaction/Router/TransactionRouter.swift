//
//  TransactionRouter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 08.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Роутер модуля Transaction
final class TransactionRouter {
	weak var viewController: UIViewController?

	init(viewController: TransactionViewController) {
		self.viewController = viewController
	}
}

//MARK: -TransactionRouterInput
extension TransactionRouter: TransactionRouterInput {
	
}
