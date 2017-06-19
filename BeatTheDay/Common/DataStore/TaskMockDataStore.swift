//
//  TaskMockDataStore.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 19/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class TaskMockDataStore {

    fileprivate var tasks: [Task] = []

    init() {
        let firstTask = Task(name: "Buy Milk", dueDate: Date(timeIntervalSinceNow: 60))
        tasks.append(firstTask)

        let secondTask = Task(name: "Buy Water", dueDate: Date(timeIntervalSinceNow: 120))
        tasks.append(secondTask)

        let thirdTask = Task(name: "Buy Biscuits", dueDate: Date(timeIntervalSinceNow: 180))
        tasks.append(thirdTask)
    }

}

// MARK: - TaskDataStore
extension TaskMockDataStore: TaskDataStore {

    func fetchAll(callback: FindAllCallback) {
        callback(tasks)
    }

}
