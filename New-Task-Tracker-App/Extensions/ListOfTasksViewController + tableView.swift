//
//  ListOfTasksViewController.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import Foundation
import UIKit
extension ListOfTasksViewController: UITableViewDataSource,UITableViewDelegate,ListOfTasksTableViewCellDelegate{
    
    
    //MARK: -DeleteTask
    
    func deleteTask(_ cell: ListOfTasksTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let alert = UIAlertController(title: "Caution", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "OK", style: .cancel){_ in
            self.viewModel.deleteTask(indexPath.row)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - tableView row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.data.count
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! ListOfTasksTableViewCell
        
        cell.delegate = self
        
       
        debugPrint(viewModel.data.count)
        let task = viewModel.data[indexPath.row]
        
        if(task.isCompleted){
        
            cell.button.setImage(Images.taskCompletedButtonIcon, for:.normal)
            cell.textView.backgroundColor = Colors.completedTask
            cell.button.tintColor = .green
            cell.textView.text = task.title
 

        } else {
            cell.button.setImage(Images.task, for: .normal)
            cell.button.tintColor = .systemBlue
            cell.textView.backgroundColor = .systemBackground
            cell.textView.text = task.title

        }
        
        return cell
    }
   
    //MARK: - TaskCompletionToggleButton
    func didTapAddButton(_ cell: ListOfTasksTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        viewModel.toggleTaskStatus(indexPath.row)
        
        let task = viewModel.data[indexPath.row]
 
        if (task.isCompleted){
            cell.button.setImage(Images.taskCompletedButtonIcon, for: .normal)
            cell.textView.backgroundColor = Colors.completedTask
            cell.button.tintColor = .green
            
        } else {
            cell.button.setImage(Images.task, for: .normal)
            cell.button.tintColor = .systemBlue
            cell.textView.backgroundColor = .systemBackground
         
        }
        
    }
}

