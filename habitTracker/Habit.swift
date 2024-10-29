//
//  Habit.swift
//  habitTracker
//
//  Created by Mariia Honcharuk on 23.10.2024.
//

import Foundation

class Habit {
    var name: String
    var isCompleted: Bool
    
    init(name: String, isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() {
        isCompleted.toggle()
    }
}

