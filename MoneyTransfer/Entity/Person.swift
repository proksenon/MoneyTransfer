//
//  Person.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
///		Информация о человеке
struct Person: Equatable, CellItemProtocol {
	var identifier: String = Cells.CellsID.defaultCell.rawValue
	/// Полное имя
	let fullName: String?
	/// Телефонный номер
	let phoneNumber: String?
	/// Картинка аватарки
	let avatarData: Data?
}
