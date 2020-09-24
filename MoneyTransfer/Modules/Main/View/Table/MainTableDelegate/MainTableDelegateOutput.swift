//
//  MainTableDelegateOutput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

/// Протокол делегата таблицы
protocol MainTableDelegateOutput: AnyObject {
	///	 Первая ячейка с картой покидает экран
	func cardInfromationLeft(_ isLeft: Bool)
	///  Выбран контакт
	func didChosePerson(indexPath: IndexPath)
}
