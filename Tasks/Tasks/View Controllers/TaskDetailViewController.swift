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
    
    func setUpAppearances() {
        view.backgroundColor = AppearanceHelper.beige
        notesTextView.textColor = AppearanceHelper.darkBlue
        notesTextView.font = AppearanceHelper.breeFont(with: .body, pointSize: 17)
        notesTextView.layer.borderWidth = 4
        notesTextView.layer.borderColor = AppearanceHelper.darkBlue.cgColor
        notesTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        
        nameTextField.font = AppearanceHelper.breeFont(with: .body, pointSize: 11)
        nameTextField.textColor = AppearanceHelper.darkBlue
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = AppearanceHelper.darkBlue.cgColor
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)

    }
}
