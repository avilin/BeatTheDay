//
//  GoalDataStore.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 19/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

protocol GoalDataStore {

    typealias FindAllCallback = ([Goal]) -> Void

    func fetchAll(callback: FindAllCallback)

}
