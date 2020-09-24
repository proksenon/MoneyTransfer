//
//  MainTableDelegate.swift
//  MoneyTransfer
//
//  Created by 18579132 on 23.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Класс делегата таблицы
final class MainTableDelegate: NSObject, UITableViewDelegate {
	
	weak var output: MainTableDelegateOutput?

	init(output: MainTableDelegateOutput) {
		super.init()
		self.output = output
	}


	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		view.tintColor = .white
		guard let header = view as? UITableViewHeaderFooterView else { return }
		header.textLabel?.textColor = UIColor.black
		header.textLabel?.font = header.textLabel?.font.withSize(20)
		header.sizeToFit()
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if indexPath.section == 1 {
			return CellsHeight.defaultCell
		} else {
			return CellsHeight.cardCell
		}
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		guard let output = output else { return }
		if scrollView.contentOffset.y > 130 {
			output.cardInfromationLeft(false)
		} else {
			output.cardInfromationLeft(true)
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let output = output else { return }
		if indexPath.section != 0 {
			output.didChosePerson(indexPath: indexPath)
		}
	}
}
