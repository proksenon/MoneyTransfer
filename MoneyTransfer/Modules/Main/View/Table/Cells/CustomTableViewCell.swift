//
//  CustomTableViewCell.swift
//  MoneyTransfer
//
//  Created by 18579132 on 30.08.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Ячейка с контактом
final class CustomTableViewCell: UITableViewCell, CellProtocol {

	private let avatarImageView = UIImageView()
	private let fullNameLabel = UILabel()
	private let phoneNumberLabel = UILabel()
	private let size = ViewConstatns.height / 11
	private let defaultImage = UIImage(named: Images.unknown)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(avatarImageView)
		addSubview(fullNameLabel)
		addSubview(phoneNumberLabel)
		setAvatarImageView()
		setFullNameLabel()
		setPhoneNumberLabel()
		backgroundColor = .white
	}

	/// Настраивает аватарку
	private func setAvatarImageView() {
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
		avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
		avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		avatarImageView.image = defaultImage
		avatarImageView.contentMode = .scaleAspectFill
		avatarImageView.roundedCorner(with: 25)
	}
	/// Настраивает лейбл полного Имени
	private func setFullNameLabel() {
		fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
		fullNameLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -35).isActive = true
		fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10).isActive = true
		fullNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		fullNameLabel.text = Labels.unknown
		fullNameLabel.textColor = .black
	}
	/// Настраивает лейбл телефонного номера
	private func setPhoneNumberLabel() {
		phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
		phoneNumberLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor , constant: -5).isActive = true
		phoneNumberLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10).isActive = true
		phoneNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		phoneNumberLabel.text = Labels.unknown
		phoneNumberLabel.textColor = .systemGray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func configureCell(with item: CellItemProtocol) {
		guard let contact = item as? Person else { return }
		if let avatardata = contact.avatarData {
			avatarImageView.image = UIImage(data: avatardata)
		} else {
			avatarImageView.image = defaultImage
		}
		if let fullName = contact.fullName {
			fullNameLabel.text = (fullName == "" || fullName == " ") ? Labels.unknown : fullName
		} else {
			fullNameLabel.text = Labels.unknown
		}
		if let phoneNumber = contact.phoneNumber {
			phoneNumberLabel.text = (phoneNumber == "" || phoneNumber == " ") ? Labels.unknown : phoneNumber
		} else {
			phoneNumberLabel.text = Labels.unknown
		}
	}
}
