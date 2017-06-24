//
//  GoalsView.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 19/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit
import Anchorage

class GoalsView: UIView {

    var tableView: UITableView!

    private var shouldSetupConstraints = true

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    private func setupView() {
        tableView = UITableView()
        tableView.rowHeight = 70
        addSubview(tableView)

        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        if (shouldSetupConstraints) {
            tableView.edgeAnchors == edgeAnchors

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

}
