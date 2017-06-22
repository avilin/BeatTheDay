//
//  Goal.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 19/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

class Goal {

    let name: String
    let completed: Bool
    let dueDate: Date

    init(name: String, completed: Bool, dueDate: Date) {
        self.name = name
        self.completed = completed
        self.dueDate = dueDate
    }

}
