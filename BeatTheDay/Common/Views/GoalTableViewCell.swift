//
//  GoalTableViewCell.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 21/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit
import Anchorage
import Chameleon

class GoalTableViewCell: UITableViewCell {

    var view: UIView!
    var statusImageView: UIImageView!
    var nameLabel: UILabel!
    var dateTimeStackView: UIStackView!
    var dateLabel: UILabel!
    var timeLabel: UILabel!

    private var shouldSetupConstraints = true

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupCell()
    }

    private func setupCell() {
        backgroundColor = .clear

        setupView()
        setupStatusImageView()
        setupNameLabel()
        setupDateTimeStackView()

        setNeedsUpdateConstraints()
    }

    private func setupView() {
        view = UIView()
        contentView.addSubview(view)
    }

    private func setupStatusImageView() {
        statusImageView = UIImageView()
        statusImageView.contentMode = .scaleAspectFit
        view.addSubview(statusImageView)
    }

    private func setupNameLabel() {
        nameLabel = UILabel()
        view.addSubview(nameLabel)
    }

    private func setupDateTimeStackView() {
        dateLabel = UILabel()
        dateLabel.textAlignment = .right

        timeLabel = UILabel()
        timeLabel.textAlignment = .right

        dateTimeStackView = UIStackView(arrangedSubviews: [dateLabel, timeLabel])
        dateTimeStackView.axis = .vertical
        dateTimeStackView.alignment = .fill
        dateTimeStackView.distribution = .fillEqually
        dateTimeStackView.spacing = 8
        dateTimeStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(dateTimeStackView)
    }

    override func updateConstraints() {
        if shouldSetupConstraints {
            view.leadingAnchor == contentView.leadingAnchor + 4
            view.topAnchor == contentView.topAnchor + 4
            view.bottomAnchor == contentView.bottomAnchor - 4
            view.trailingAnchor == contentView.trailingAnchor - 4

            statusImageView.leadingAnchor == view.leadingAnchor + 8
            statusImageView.topAnchor == view.topAnchor + 16
            statusImageView.bottomAnchor == view.bottomAnchor - 16
            statusImageView.widthAnchor == statusImageView.heightAnchor

            nameLabel.leadingAnchor == statusImageView.trailingAnchor + 8
            nameLabel.topAnchor == view.topAnchor + 8
            nameLabel.bottomAnchor == view.bottomAnchor - 8

            dateTimeStackView.leadingAnchor == nameLabel.trailingAnchor + 8
            dateTimeStackView.topAnchor == view.topAnchor + 8
            dateTimeStackView.bottomAnchor == view.bottomAnchor - 8
            dateTimeStackView.trailingAnchor == view.trailingAnchor - 8

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

    func styleCellWithBackgroundColor(_ backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
        let textColor = ContrastColorOf(backgroundColor, returnFlat: true)
        nameLabel.textColor = textColor
        dateLabel.textColor = textColor
        timeLabel.textColor = textColor
    }

}
