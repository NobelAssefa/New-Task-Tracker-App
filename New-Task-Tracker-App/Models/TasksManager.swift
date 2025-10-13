//
//  TasksManager.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import Foundation

class TasksManager {
     var tasks: [Tasks] = []
     init(){
         tasks = [
            Tasks(title: "Use a loop to print numbers from 1 to 10. ", isCompleted: false),
            Tasks(title: "Write a conditional statement that checks if a number is even or odd.", isCompleted: false),
            Tasks(title: "Add a button to a SwiftUI view and print a message when tapped.", isCompleted: false),
            Tasks(title: "Define a struct called Person with name and age properties.", isCompleted: true),
            Tasks(title: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor  ", isCompleted: true),
            Tasks(title: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor  ", isCompleted: true)
         ]
            
     }
    
    func listAllTasks() -> [Tasks]{
        return tasks
    }
    func addTask(task: Tasks){
        tasks.append(task)
    }
    
    func filterTasks() -> [Tasks]{
        return tasks.filter({ $0.isCompleted == false })
    }
    
    
}
