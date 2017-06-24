//
//  GoalCellDTO.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 22/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import UIKit

class GoalCellDTO {

    let name: String
    let statusImage: UIImage
    let statusColor: UIColor
    let date: String
    let time: String

    init(name: String, statusImage: UIImage, statusColor: UIColor, date: String, time: String) {
        self.name = name
        self.statusImage = statusImage
        self.statusColor = statusColor
        self.date = date
        self.time = time
    }

}
