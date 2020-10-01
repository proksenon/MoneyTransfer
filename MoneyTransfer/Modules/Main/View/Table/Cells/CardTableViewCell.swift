//
//  CardTableViewCell.swift
//  MoneyTransfer
//
//  Created by 18579132 on 31.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Ячейка с картой
final class CardTableViewCell: UITableViewCell, CellProtocol {

	private let cardView = UIView()
	private let balanceLabel = UILabel()
	private let curencyBalanceLabel = UILabel()
	private let labelCardImageView = UIImageView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .white
		setCardView()
		setBalanceLabel()
		setCurrencyBalanceLabel()
		setLabelCardImageView()
		backgroundColor = .white
	}

	/// Константы
	private enum Constants {
		static let defConstraint: CGFloat = 30
	}

	/// Настройка Card View
	private func setCardView() {
		addSubview(cardView)
		cardView.translatesAutoresizingMaskIntoConstraints = false
		cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.defConstraint).isActive = true
		cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.defConstraint).isActive = true
		cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.defConstraint).isActive = true
		cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.defConstraint).isActive = true

		cardView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
		let frame = CGRect(x: 0, y: 0, width: ViewConstatns.width - Constants.defConstraint, height: 250)
		cardView.decorate(with: [CornerRadiusDecorator(cornerRadius: 10), GradientViewDecorator(colors: [UIColor.gray.cgColor, UIColor.black.cgColor], frame: frame)])
	}

	/// Настройка лейбла Баланса
	private func setBalanceLabel() {
		cardView.addSubview(balanceLabel)
		balanceLabel.translatesAutoresizingMaskIntoConstraints = false
		balanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: Constants.defConstraint).isActive = true
		balanceLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -Constants.defConstraint).isActive = true
		balanceLabel.backgroundColor = .clear
		balanceLabel.font = balanceLabel.font.withSize(33)
		balanceLabel.text = "103 542,5 Р"
		balanceLabel.textColor = .white
	}

	/// Настройка лейбла с Текущим балансом
	private func setCurrencyBalanceLabel() {
		cardView.addSubview(curencyBalanceLabel)
		curencyBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		curencyBalanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: Constants.defConstraint).isActive = true
		curencyBalanceLabel.bottomAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: -10).isActive = true
		curencyBalanceLabel.backgroundColor = .clear
		curencyBalanceLabel.font = curencyBalanceLabel.font.withSize(17)
		curencyBalanceLabel.text = Labels.currentBalance
		curencyBalanceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
	}

	/// Настройка Картинки карты
	private func setLabelCardImageView() {
		cardView.addSubview(labelCardImageView)
		labelCardImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([labelCardImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: Constants.defConstraint),
									 labelCardImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Constants.defConstraint),
									 labelCardImageView.heightAnchor.constraint(equalToConstant: 2*Constants.defConstraint),
									 labelCardImageView.widthAnchor.constraint(equalToConstant: 2*Constants.defConstraint)])

		labelCardImageView.image = UIImage(named: Images.logo)
		labelCardImageView.contentMode = .scaleAspectFit
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

	func configureCell(with item: CellItemProtocol) {
		guard let balance = item as? Balance else { return }
		balanceLabel.text = balance.balance.moneyFormat()
	}
}

