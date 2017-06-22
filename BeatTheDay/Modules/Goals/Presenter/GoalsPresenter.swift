//
//  GoalListPresenter.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class GoalsPresenter {

    weak var view: GoalsViewInterface?
    var interactor: GoalsInteractorInput?
    var router: GoalsWireFrame?

}

// MARK: - GoalsModuleInterface
extension GoalsPresenter: GoalsModuleInterface {

    func updateView() {
        interactor?.fetchAllGoals()
    }

}

// MARK: - GoalsInteractorOutput
extension GoalsPresenter: GoalsInteractorOutput {

    func goalsFetched(_ goals: [Goal]) {
        let goalDTOs = goals.map { (goal) -> GoalDTO in
            var status = GoalStatus.pending
            if goal.completed {
                status = .completed
            } else if goal.dueDate > Date() {
                status = .pending
            } else {
                status = .expired
            }
            return GoalDTO(name: goal.name, goalStatus: status)
        }
        view?.showGoals(goalDTOs)
    }

}
