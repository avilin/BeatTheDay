//
//  GoalsWireframe.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit

class GoalsRouter {

    weak var viewController: UIViewController?

    func assembleModule() -> UIViewController {
        let view = GoalsViewController()
        let presenter = GoalsPresenter()
        let interactor = GoalsInteractor()
        let goalDataStore = GoalMockDataStore()

        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataStore = goalDataStore

        return view
    }

}

extension GoalsRouter: GoalsWireFrame {

}
