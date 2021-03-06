//
//  MainTableDataSource.swift
//  MoneyTransfer
//
//  Created by 18579132 on 24.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Кастомная ДатаСорс для Таблицы на главном экране
class MainTableDataSource: NSObject, UITableViewDataSource {

	weak var output: MainTableDataSourceOutput?

	init(output: MainTableDataSourceOutput) {
		super.init()
		self.output = output
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			guard let output = output else { return 0}
			return output.countOfPersons()
		}
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return Labels.contacts
		}
		return nil
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let output = output else { return UITableViewCell() }
		let itemCell: CellItemProtocol = output.itemCell(with: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: itemCell.identifier) as? CellProtocol
		cell?.configureCell(with: itemCell)
		guard let currentCell = cell else { return UITableViewCell()}
		return currentCell
	}

}
