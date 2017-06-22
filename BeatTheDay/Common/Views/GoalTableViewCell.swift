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

    var label: UILabel!

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
        label = UILabel()
        contentView.addSubview(label)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        if (shouldSetupConstraints) {

            label.leadingAnchor == contentView.leadingAnchor + 8
            label.trailingAnchor == contentView.trailingAnchor + 8
            label.topAnchor == contentView.topAnchor + 8
            label.bottomAnchor == contentView.bottomAnchor + 8

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

}
