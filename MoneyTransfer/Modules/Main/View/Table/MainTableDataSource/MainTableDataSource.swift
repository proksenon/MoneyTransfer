//
//  MainTableDataSource.swift
//  MoneyTransfer
//
//  Created by 18579132 on 24.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

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
			return "Контакты"
		}
		return nil
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let output = output else { return UITableViewCell() }
		if indexPath.section == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
			cell.configureCell(with: output.getPerson(with: indexPath))
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! CardTableViewCell
			cell.configureCell(with: output.getBalance())
			return cell
		}
	}

}
