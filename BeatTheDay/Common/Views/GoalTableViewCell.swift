//
//  GoalTableViewCell.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 21/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit
import Anchorage

class GoalTableViewCell: UITableViewCell {

    var statusImageView: UIImageView!
    var nameLabel: UILabel!
    var dateTimeStackView: UIStackView!
    var dateLabel: UILabel!
    var timeLabel: UILabel!

    private var shouldSetupConstraints = true

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    private func setupView() {
        setupStatusImageView()
        setupNameLabel()
        setupDateTimeStackView()

        setNeedsUpdateConstraints()
    }

    private func setupStatusImageView() {
        statusImageView = UIImageView()
        statusImageView.contentMode = .scaleAspectFit
        contentView.addSubview(statusImageView)
    }

    private func setupNameLabel() {
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
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

        contentView.addSubview(dateTimeStackView)
    }

    override func updateConstraints() {
        if (shouldSetupConstraints) {
            statusImageView.leadingAnchor == contentView.leadingAnchor + 8
            statusImageView.topAnchor == contentView.topAnchor + 16
            statusImageView.bottomAnchor == contentView.bottomAnchor - 16
            statusImageView.widthAnchor == statusImageView.heightAnchor

            nameLabel.leadingAnchor == statusImageView.trailingAnchor + 8
            nameLabel.topAnchor == contentView.topAnchor + 8
            nameLabel.bottomAnchor == contentView.bottomAnchor - 8

            dateTimeStackView.leadingAnchor == nameLabel.trailingAnchor + 8
            dateTimeStackView.topAnchor == contentView.topAnchor + 8
            dateTimeStackView.bottomAnchor == contentView.bottomAnchor - 8
            dateTimeStackView.trailingAnchor == contentView.trailingAnchor - 8

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

}
