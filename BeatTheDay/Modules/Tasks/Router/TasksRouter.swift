//
//  TasksWireframe.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit

class TasksRouter {

    weak var viewController: UIViewController?

    func assembleModule() -> UIViewController {
        let view = TasksViewController()
        let presenter = TasksPresenter()
        let interactor = TasksInteractor()
        let taskDataStore = TaskMockDataStore()

        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataStore = taskDataStore

        return view
    }

}

extension TasksRouter: TasksWireFrame {

}
