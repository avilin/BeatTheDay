//
//  GoalMockDataStore.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 19/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class GoalMockDataStore {

    fileprivate var goals: [Goal] = []

    init() {
        let firstGoal = Goal(name: "Buy Milk", dueDate: Date(timeIntervalSinceNow: 60))
        goals.append(firstGoal)

        let secondGoal = Goal(name: "Buy Water", dueDate: Date(timeIntervalSinceNow: 120))
        goals.append(secondGoal)

        let thirdGoal = Goal(name: "Buy Biscuits", dueDate: Date(timeIntervalSinceNow: 180))
        goals.append(thirdGoal)
    }

}

// MARK: - GoalDataStore
extension GoalMockDataStore: GoalDataStore {

    func fetchAll(callback: FindAllCallback) {
        callback(goals)
    }

}
