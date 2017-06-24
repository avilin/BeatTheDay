//
//  GoalListPresenter.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit

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
        let goalCellDTOs = goals.map { (goal) -> GoalCellDTO in
            let status = interactor.statusForGoal(goal)
            var statusImage = #imageLiteral(resourceName: "Time")
            var statusColor = UIColor.gray
            switch status {
            case .completed:
                statusImage = #imageLiteral(resourceName: "Check")
                statusColor = UIColor.green
            case .pending:
                statusImage = #imageLiteral(resourceName: "Time")
                statusColor = UIColor.gray
            case .expired:
                statusImage = #imageLiteral(resourceName: "Denied")
                statusColor = UIColor.red
            }
            let date = goal.dueDate.stringWithFormat("dd/MM/yy")
            let time = goal.dueDate.stringWithFormat("HH:mm a")
            
            return GoalCellDTO(name: goal.name, statusImage: statusImage, statusColor: statusColor, date: date, time: time)
        }
        view?.showGoals(goalCellDTOs)
    }

}
