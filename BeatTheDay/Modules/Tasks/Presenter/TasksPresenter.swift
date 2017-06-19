//
//  TaskListPresenter.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

class TasksPresenter {

    weak var view: TasksViewInterface?
    var interactor: TasksInteractorInput?
    var router: TasksWireFrame?

}

// MARK: - TasksModuleInterface
extension TasksPresenter: TasksModuleInterface {

    func updateView() {
        interactor?.fetchAllTasks()
    }

}

// MARK: - TasksInteractorOutput
extension TasksPresenter: TasksInteractorOutput {

    func tasksFetched(_ tasks: [Task]) {
        view?.showTasks(tasks)
    }

}
