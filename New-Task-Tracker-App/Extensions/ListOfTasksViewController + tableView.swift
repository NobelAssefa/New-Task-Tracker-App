//
//  ListOfTasksViewController.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import Foundation
import UIKit
extension ListOfTasksViewController: UITableViewDataSource,UITableViewDelegate,ListOfTasksTableViewCellDelegate{
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return viewModel.dataSource.count
            
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
            
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! ListOfTasksTableViewCell
        cell.delegate = self
        let task = viewModel.dataSource[indexPath.row]
        if(task.isCompleted){
            cell.button.setImage(Images.taskCompletedButtonIcon, for:.normal)
            cell.button.tintColor = .green
            cell.textView.alpha = 0.3
            cell.textView.backgroundColor = .systemGray6
            cell.textView.text = task.title

        } else {
            cell.button.setImage(Images.task, for: .normal)
            cell.textView.alpha = 1
            cell.button.tintColor = .systemBlue
            cell.textView.backgroundColor = .systemBackground
            cell.textView.text = task.title
            
        }
        
        return cell
    }
   
    func didTapAddButton(_ cell: ListOfTasksTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.dataSource[indexPath.row].isCompleted.toggle()
        let task = viewModel.dataSource[indexPath.row]
        
        print(task.isCompleted)
        if(task.isCompleted){
            cell.button.setImage(Images.taskCompletedButtonIcon, for: .normal)
            cell.button.tintColor = .green
            cell.textView.alpha = 0.3
            cell.textView.backgroundColor = .systemGray6

        } else {
            cell.button.setImage(Images.task, for: .normal)
            cell.textView.alpha = 1
            cell.button.tintColor = .systemBlue
            cell.textView.backgroundColor = .systemBackground
            
        }
        
    }
}

