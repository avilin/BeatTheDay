//
//  TaskListViewController.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit

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
        view.backgroundColor = UIColor.white
    }

    func updateView() {
        presenter?.updateView()
    }

}

// MARK: - TasksViewInterface
extension TasksViewController: TasksViewInterface {

    func showTasks(_ tasks: [Task]) {
        self.tasks = tasks
    }

}
