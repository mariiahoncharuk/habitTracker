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

// Testing the ViewController behavior
class ViewControllerTests: XCTestCase {
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        
        // Instantiate ViewController from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testAddHabit() {
        // Simulate adding a new habit
        viewController.habits = []
        
        let initialCount = viewController.habits.count
        let newHabit = Habit(name: "Read")
        viewController.habits.append(newHabit)
        
        XCTAssertEqual(viewController.habits.count, initialCount + 1, "Habit count should increase by 1")
        XCTAssertEqual(viewController.habits.last?.name, "Read", "The last habit's name should be 'Read'")
    }
    
    func testToggleHabitCompletion() {
        // Create a habit and add it to the list
        let habit = Habit(name: "Exercise")
        viewController.habits = [habit]
        
        // Toggle completion status
        viewController.habits[0].toggleCompletion()
        
        XCTAssertTrue(viewController.habits[0].isCompleted, "Habit should be marked as completed after toggle")
        
        viewController.habits[0].toggleCompletion()
        XCTAssertFalse(viewController.habits[0].isCompleted, "Habit should be marked as not completed after second toggle")
    }
    
    func testTableViewNumberOfRows() {
        // Check that the table view displays the correct number of rows
        viewController.habits = [Habit(name: "Exercise"), Habit(name: "Meditate")]
        let numberOfRows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, viewController.habits.count, "Number of rows in table view should match number of habits")
    }
}
