//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Peter Pickett on 8/21/17.
//  Copyright © 2017 Peter Pickett. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
   
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addTask(_ sender: Any) {
      // whole goal is to create a task from the outlets we have.
      let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        
        previousVC.tableView.reloadData()
        
        
        navigationController!.popViewController(animated: true)
        
    }

}
