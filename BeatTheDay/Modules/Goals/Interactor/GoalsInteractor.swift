//
//  GoalListInteractor.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class GoalsInteractor {

    weak var presenter: GoalsInteractorOutput?
    var dataStore: GoalDataStore?

}

// MARK: - GoalsInteractorInput
extension GoalsInteractor: GoalsInteractorInput {

    func fetchAllGoals() {
        dataStore?.fetchAll(callback: { (goals) in
            presenter?.goalsFetched(goals)
        })
    }

    func statusForGoal(_ goal: Goal) -> GoalStatus {
        var status = GoalStatus.pending
        if goal.completed {
            status = .completed
        } else if goal.dueDate > Date() {
            status = .pending
        } else {
            status = .expired
        }
        return status
    }

}
