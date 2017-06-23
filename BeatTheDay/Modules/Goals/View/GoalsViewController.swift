//
//  GoalListViewController.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit
import Anchorage

class GoalsViewController: UIViewController {

    var presenter: GoalsModuleInterface?

    fileprivate var goals: [GoalDTO] = []
    fileprivate var goalsView: GoalsView!

    fileprivate let refreshControl = UIRefreshControl()

    override func loadView() {
        super.loadView()

        view = GoalsView(frame: .zero)
        goalsView = view as! GoalsView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        goalsView.tableView.register(GoalTableViewCell.self, forCellReuseIdentifier: "GoalCell")
        goalsView.tableView.dataSource = self

        if #available(iOS 10.0, *) {
            goalsView.tableView.refreshControl = refreshControl
        } else {
            goalsView.tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(updateView), for: .valueChanged)

        updateView()
    }

    func updateView() {
        presenter?.updateView()
        refreshControl.endRefreshing()
    }

}

// MARK: - GoalsViewInterface
extension GoalsViewController: GoalsViewInterface {

    func showGoals(_ goals: [GoalDTO]) {
        self.goals = goals
        goalsView.tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension GoalsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath)
        guard let goalCell = cell as? GoalTableViewCell else {
            fatalError("Wrong cell")
        }

        goalCell.selectionStyle = .none

        let goal = goals[indexPath.row]

        var image = #imageLiteral(resourceName: "Time")
        var backgroundColor = UIColor.gray
        switch goal.goalStatus {
        case .completed:
            image = #imageLiteral(resourceName: "Check")
            backgroundColor = UIColor.green
        case .pending:
            image = #imageLiteral(resourceName: "Time")
            backgroundColor = UIColor.gray
        case .expired:
            image = #imageLiteral(resourceName: "Denied")
            backgroundColor = UIColor.red
        }
        goalCell.statusImageView.image = image
        goalCell.backgroundColor = backgroundColor
        
        goalCell.nameLabel.text = goal.name
        goalCell.dateLabel.text = goal.date

        return goalCell
    }

}
