//
//  SuccessOperationInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Интерактор модуля Success
final class SuccessOperationInteractor {

	weak var output: SuccessOperationInteractorOutput?

	init(presenter: SuccessOperationInteractorOutput) {
		self.output = presenter
	}
}

//MARK: -SuccessOperationInteractorInput
extension SuccessOperationInteractor: SuccessOperationInteractorInput {
	
}
