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

    var nameLabel: UILabel!

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
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        if (shouldSetupConstraints) {

            nameLabel.leadingAnchor == contentView.leadingAnchor + 8
            nameLabel.trailingAnchor == contentView.trailingAnchor + 8
            nameLabel.topAnchor == contentView.topAnchor + 8
            nameLabel.bottomAnchor == contentView.bottomAnchor + 8

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

}
