//
//  ListOfTasksViewModel.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import Foundation
class ListOfTasksViewModel {
   

    var data = UserDefault.loadTasks()
    
    var copy:[Tasks] = []
    
    init(){
        if(data.count == 0){
            UserDefault.updateUserDefault(TasksManager.tasks.tasks)

        }
    }
    func deleteTask (_ index: Int){
        data.remove(at: index)
        copy = data
        UserDefault.updateUserDefault(data)
    }
    
    func addTask (_ task:Tasks){
        data.append(task)
        debugPrint("new added Task:\(data)")
        copy = data
        UserDefault.updateUserDefault(data)
    }
    
    func toggleTaskStatus(_ index: Int){
        debugPrint("Data that is going to be toggled:\(data[index])")
        data[index].isCompleted.toggle()
        UserDefault.updateUserDefault(data)
    }
    
}
