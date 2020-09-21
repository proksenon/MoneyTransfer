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
	private let labelCardImageView = UIImageView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .white
		setCardImageView()
		setBalanceLabel()
		setCurrencyBalanceLabel()
		setLabelCardImageView()
		backgroundColor = .white

	}
	private func setCardImageView() {
		var gradientLayer: CAGradientLayer = {
			let gradientLayer = CAGradientLayer()
			gradientLayer.colors = [UIColor.gray.cgColor, UIColor.black.cgColor]//Colors you want to add
			gradientLayer.startPoint = CGPoint(x: 0, y: 0)
			gradientLayer.endPoint = CGPoint(x: 1, y: 1)
			gradientLayer.frame = CGRect.zero
		   return gradientLayer
		}()

		addSubview(cardView)
		cardView.translatesAutoresizingMaskIntoConstraints = false
		cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
		cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
		cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
		cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
		cardView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
		cardView.roundedCorner(with: 10)
		gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 250)
		cardView.layer.insertSublayer(gradientLayer, at: 0)
	}

	private func setBalanceLabel() {
		cardView.addSubview(balanceLabel)
		balanceLabel.translatesAutoresizingMaskIntoConstraints = false
		balanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30).isActive = true
		balanceLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -30).isActive = true
		balanceLabel.backgroundColor = .clear
		balanceLabel.font = balanceLabel.font.withSize(33)
		balanceLabel.text = "103 542,5Р"
		balanceLabel.textColor = .white
	}

	private func setCurrencyBalanceLabel() {
		cardView.addSubview(curencyBalanceLabel)
		curencyBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
		curencyBalanceLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30).isActive = true
		curencyBalanceLabel.bottomAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: -10).isActive = true
		curencyBalanceLabel.backgroundColor = .clear
		curencyBalanceLabel.font = curencyBalanceLabel.font.withSize(17)
		curencyBalanceLabel.text = "Текущий баланс"
		curencyBalanceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
	}

	private func setLabelCardImageView() {
		cardView.addSubview(labelCardImageView)
		labelCardImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([labelCardImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30),
									 labelCardImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 30),
									 labelCardImageView.heightAnchor.constraint(equalToConstant: 60),
									 labelCardImageView.widthAnchor.constraint(equalToConstant: 60)])

		labelCardImageView.image = UIImage(named: "logo")
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

	func configureCell(with balance: String) {
		balanceLabel.text = balance.moneyFormat()
	}
}
