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
    var interactor: GoalsInteractorInput!
    var router: GoalsWireFrame!

}

// MARK: - GoalsModuleInterface
extension GoalsPresenter: GoalsModuleInterface {

    func updateView() {
        interactor.fetchAllGoals()
    }

}

// MARK: - GoalsInteractorOutput
extension GoalsPresenter: GoalsInteractorOutput {

    func goalsFetched(_ goals: [Goal]) {
        let goalDTOs = goals.map { (goal) -> GoalDTO in
            let status = interactor.statusForGoal(goal)
            let date = goal.dueDate.stringWithFormat("dd/MM/yy")
            let time = goal.dueDate.stringWithFormat("HH:mm a")
            return GoalDTO(name: goal.name, goalStatus: status, date: date, time: time)
        }
        view?.showGoals(goalDTOs)
    }

}
