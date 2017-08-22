//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Peter Pickett on 8/22/17.
//  Copyright © 2017 Peter Pickett. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    var task = Task()
     var previousVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var importantLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskLabel.text = task.name
        if task.important {
            importantLabel.text = "IMPORTANT"
        }
        else {
            importantLabel.text = "NOT important"
        }
        
        // Do any additional setup after loading the view.
    }

    

    @IBAction func completeTask(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        previousVC.tableView.reloadData()
        
        
        navigationController!.popViewController(animated: true)
    }
    
    
    
}
