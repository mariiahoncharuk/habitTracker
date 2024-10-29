//
//  ViewController.swift
//  habitTracker
//
//  Created by Mariia Honcharuk on 23.10.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    // A list of habits
    var habits = [Habit]()
        
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source and delegate of the table view
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath)
        
        // Configure the cell with habit data
        let habit = habits[indexPath.row]
        cell.textLabel?.text = habit.name
        cell.accessoryType = habit.isCompleted ? .checkmark : .none
        
        return cell
    }
    
    // UITableViewDelegate method to handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Toggle habit completion status
        habits[indexPath.row].toggleCompletion()
        
        // Reload the row to update the checkmark
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Action for adding a new habit
    @IBAction func addHabit(_ sender: UIBarButtonItem) {
        // Show an alert to add a new habit
        let alert = UIAlertController(title: "New Habit", message: "Enter a name for the habit", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Habit name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let habitName = alert.textFields?.first?.text, !habitName.isEmpty {
                // Create a new habit and add it to the list
                let newHabit = Habit(name: habitName)
                self?.habits.append(newHabit)
                
                // Reload the table view to show the new habit
                self?.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
