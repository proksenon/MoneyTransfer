//
//  CardTableViewCell.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class CardTableViewCell: UITableViewCell {

	private let cardView = UIView()
	private let balanceLabel = UILabel()
	private let curencyBalanceLabel = UILabel()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .white
		setCardImageView()
		setBalanceLabel()
		setCurrencyBalanceLabel()
		backgroundColor = .white

	}
	func setCardImageView() {
		addSubview(cardView)
		cardView.translatesAutoresizingMaskIntoConstraints = false
		cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
		cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
		cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
		cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
		cardView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
		cardView.roundedCorner(with: 10)

	}

	func setBalanceLabel() {
		cardView.insertSubview(balanceLabel, at: 0)
		balanceLabel.translatesAutoresizingMaskIntoConstraints = false
		balanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30).isActive = true
		balanceLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -30).isActive = true
		balanceLabel.backgroundColor = .clear
		balanceLabel.font = balanceLabel.font.withSize(33)
		balanceLabel.text = "103 542,5Р"
		balanceLabel.textColor = .white
	}

	func setCurrencyBalanceLabel() {
		cardView.insertSubview(curencyBalanceLabel, at: 1)
		curencyBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		curencyBalanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30).isActive = true
		curencyBalanceLabel.bottomAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: -10).isActive = true
		curencyBalanceLabel.backgroundColor = .clear
		curencyBalanceLabel.font = curencyBalanceLabel.font.withSize(17)
		curencyBalanceLabel.text = "Текущий баланс"
		curencyBalanceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func configureCell(with balance: String) {
		balanceLabel.text = balance
	}
}
