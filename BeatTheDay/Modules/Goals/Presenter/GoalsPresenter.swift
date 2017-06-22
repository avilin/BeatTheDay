//
//  GoalListPresenter.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

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
        view?.showGoals(goals)
    }

}
