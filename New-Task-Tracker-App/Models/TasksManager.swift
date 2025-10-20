//
//  TasksManager.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import Foundation

class TasksManager:Codable {
    static var tasks = TasksManager()
    
    var tasks: [Tasks] = UserDefault.loadTasks() 
    
     private init(){
         tasks = [
            Tasks(title: "Abel. ", isCompleted: false),
            Tasks(title: "Guluma", isCompleted: false),
            Tasks(title: "T", isCompleted: true),
            Tasks(title: "Lelisa", isCompleted: false),
            Tasks(title: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor  ", isCompleted: false),
            Tasks(title: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor  ", isCompleted: false)
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
