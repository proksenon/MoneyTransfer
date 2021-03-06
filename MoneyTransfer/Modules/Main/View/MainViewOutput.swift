//
//  MainOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainViewOutput: class {
	///  Конвигурирует View
	func configureView()
	///	 Первая ячейка с картой покидает экран
	func cardInfromationLeft(_ isLeft: Bool)
	///  Выбран контакт
	func didChosePerson(indexPath: IndexPath)
	///  Закрывает StatusOperation
	func dissmissStatusOperation()
}
