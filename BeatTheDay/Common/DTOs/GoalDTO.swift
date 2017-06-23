//
//  GoalDTO.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 22/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class GoalDTO {

    let name: String
    let goalStatus: GoalStatus
    let date: String

    init(name: String, goalStatus: GoalStatus, date: String) {
        self.name = name
        self.goalStatus = goalStatus
        self.date = date
    }

}

enum GoalStatus {
    case completed
    case pending
    case expired
}
