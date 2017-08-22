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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addTask(_ sender: Any) {
      // whole goal is to create a task from the outlets we have.
      
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
        
        navigationController!.popViewController(animated: true)
        
    }

}
