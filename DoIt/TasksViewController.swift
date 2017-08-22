//
//  TasksViewController.swift
//  DoIt
//
//  Created by Peter Pickett on 8/21/17.
//  Copyright © 2017 Peter Pickett. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        let task = tasks[indexPath.row]
        if task.important {
          cell.textLabel?.text = "❗️\(task.name)"
        }
        else {
         cell.textLabel?.text = task.name
        }
        return cell
    }

    func makeTasks () -> [Task] {
        let task1 = Task()
        task1.name = "Pick up milk"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Do more stuff"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Mow grass"
        task3.important = false
        
        return [task1, task2, task3]
    }

    @IBAction func plusTap(_ sender: Any) {
       performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "collectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
    // here we're going to complete task viewcontroller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "collectTaskSegue", sender: task)
    }
    
    
    
    
}

