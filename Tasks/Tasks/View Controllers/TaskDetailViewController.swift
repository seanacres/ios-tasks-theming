//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Andrew R Madsen on 8/11/18.
//  Copyright © 2018 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setUpAppearances()
    }

    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let priorityIndex = priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allPriorities[priorityIndex]
        let notes = notesTextView.text
        
        if let task = task {
            // Editing existing task
            taskController.update(task: task, with: name, notes: notes, priority: priority)
        } else {
            taskController.createTask(with: name, notes: notes, priority: priority)
        }

        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
                
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        let priority: TaskPriority
        if let taskPriority = task?.priority {
            priority = TaskPriority(rawValue: taskPriority)!
        } else {
            priority = .normal
        }
        priorityControl.selectedSegmentIndex = TaskPriority.allPriorities.firstIndex(of: priority)!
        notesTextView.text = task?.notes
    }
    
    // MARK: Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var taskController: TaskController!

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priorityControl: UISegmentedControl!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priority: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    func setUpAppearances() {
        view.backgroundColor = AppearanceHelper.beige
        title = ""
        notesTextView.textColor = AppearanceHelper.darkBlue
        notesTextView.font = AppearanceHelper.breeFont(with: .body, pointSize: 18)
        notesTextView.layer.borderWidth = 4
        notesTextView.layer.borderColor = AppearanceHelper.darkBlue.cgColor
        notesTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        
        nameTextField.font = AppearanceHelper.breeFont(with: .body, pointSize: 18)
        nameTextField.textColor = AppearanceHelper.darkBlue
        
        nameLabel.font = AppearanceHelper.breeFont(with: .title3, pointSize: 18)
        priority.font = AppearanceHelper.breeFont(with: .title3, pointSize: 18)
        notesLabel.font = AppearanceHelper.breeFont(with: .title3, pointSize: 18)
        

    }
}
