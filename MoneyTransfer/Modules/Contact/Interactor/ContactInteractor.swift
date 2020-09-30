//
//  ContactInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 06.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Интерактор модуля Contact
final class ContactInteractor {

	weak var output: ContactInteractorOutput?

	init(output: ContactInteractorOutput) {
		self.output = output
	}
}
//MARK: -ContactInteractorInput
extension ContactInteractor: ContactInteractorInput {
	
}
