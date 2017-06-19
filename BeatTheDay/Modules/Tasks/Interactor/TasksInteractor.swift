//
//  TaskListInteractor.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

class TasksInteractor {

    weak var presenter: TasksInteractorOutput?
    var dataStore: TaskDataStore?

}

// MARK: - TasksInteractorInput
extension TasksInteractor: TasksInteractorInput {

    func fetchAllTasks() {
        dataStore?.fetchAll(callback: { (tasks) in
            presenter?.tasksFetched(tasks)
        })
    }

}
