//
//  TaskListViewController.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit
import Anchorage

class TasksViewController: UIViewController {

    var presenter: TasksModuleInterface?

    fileprivate var tasks: [Task] = []
    fileprivate var tasksView: TasksView!

    override func loadView() {
        super.loadView()

        view = TasksView(frame: .zero)
        tasksView = view as! TasksView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tasksView.tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskCell")
        tasksView.tableView.dataSource = self

        updateView()
    }

    func updateView() {
        presenter?.updateView()
    }

}

// MARK: - TasksViewInterface
extension TasksViewController: TasksViewInterface {

    func showTasks(_ tasks: [Task]) {
        self.tasks = tasks
        tasksView.tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension TasksViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        guard let taskCell = cell as? TaskTableViewCell else {
            fatalError("Wrong cell")
        }

        taskCell.label.text = tasks[indexPath.row].name

        return taskCell
    }

}
