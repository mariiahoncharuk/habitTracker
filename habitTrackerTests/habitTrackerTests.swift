//
//  habitTrackerTests.swift
//  habitTrackerTests
//
//  Created by Mariia Honcharuk on 23.10.2024.
//

import XCTest
@testable import habitTracker

// Testing the Habit Model
class HabitTests: XCTestCase {

    func testHabitInitialization() {
        // Test habit initialization with a name and default isCompleted value
        let habit = Habit(name: "Exercise")
        XCTAssertEqual(habit.name, "Exercise", "Habit name should be 'Exercise'")
        XCTAssertFalse(habit.isCompleted, "isCompleted should be false by default")
    }
    
    func testToggleCompletion() {
        // Test the toggleCompletion function
        let habit = Habit(name: "Meditate")
        XCTAssertFalse(habit.isCompleted, "Habit should be initially not completed")
        
        habit.toggleCompletion()
        XCTAssertTrue(habit.isCompleted, "Habit should be completed after toggling")
        
        habit.toggleCompletion()
        XCTAssertFalse(habit.isCompleted, "Habit should be not completed after toggling again")
    }
}

