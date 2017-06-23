//
//  GoalListInteractorInput.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 18/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

protocol GoalsInteractorInput: class {

    func fetchAllGoals()
    func statusForGoal(_ goal: Goal) -> GoalStatus

}
