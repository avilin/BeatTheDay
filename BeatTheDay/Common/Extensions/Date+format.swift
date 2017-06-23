//
//  Date+format.swift
//  BeatTheDay
//
//  Created by Andrés Vicente Linares on 23/6/17.
//  Copyright © 2017 Andrés Vicente Linares. All rights reserved.
//

import Foundation

extension Date {

    func stringWithFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
