//
//  UserDefault.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 20/10/2025.
//

import Foundation
class UserDefault{
    
    static let viewModel = ListOfTasksViewModel()
    
    static func loadTasks()->[Tasks]{
        let defaults = UserDefaults.standard
       
        if let savedData = defaults.data(forKey: "tasks"){
            do{
                
                let decodeData = try JSONDecoder().decode([Tasks]
                    .self, from: savedData)
                return decodeData
                
            }catch{
                debugPrint("Unable to load loadTasks")
            }
        }
        return []
    }

    
    
    static func updateUserDefault(_ data: [Tasks]){
        do{
            
            let defaults = UserDefaults.standard
            let encodeData = try JSONEncoder().encode(data)
            
            debugPrint("dataSource that is going to be saved (encoded): \(data)")
            defaults.set(encodeData, forKey: "tasks")
        }catch{
            debugPrint("failed to save Task")
        }
    }
    
}
