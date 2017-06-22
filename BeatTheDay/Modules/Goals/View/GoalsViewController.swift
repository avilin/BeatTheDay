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

    fileprivate var goals: [Goal] = []
    fileprivate var goalsView: GoalsView!

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

        updateView()
    }

    func updateView() {
        presenter?.updateView()
    }

}

// MARK: - GoalsViewInterface
extension GoalsViewController: GoalsViewInterface {

    func showGoals(_ goals: [Goal]) {
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

        goalCell.statusImageView.image = #imageLiteral(resourceName: "Time")
        goalCell.nameLabel.text = goals[indexPath.row].name

        return goalCell
    }

}
