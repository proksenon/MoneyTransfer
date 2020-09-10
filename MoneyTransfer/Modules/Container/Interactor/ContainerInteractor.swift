//
//  TreatmentTransactionInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class ContainerInteractor {

	weak var output: ContainerInteractorOutput?

	init(presenter: ContainerInteractorOutput) {
		self.output = presenter
	}
}
extension ContainerInteractor: ContainerInteractorInput {
	
}
