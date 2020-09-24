//
//  CustomTable.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Таблица контактов
final class CustomTableView: UITableView {

	init() {
		super.init(frame: .zero, style: .grouped)
		register(CustomTableViewCell.self, forCellReuseIdentifier: Cells.CellsID.defaultCell.rawValue)
		register(CardTableViewCell.self, forCellReuseIdentifier: Cells.CellsID.cardCell.rawValue)
		tableFooterView = UIView()
		separatorStyle = .singleLine
		backgroundColor = .white
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
