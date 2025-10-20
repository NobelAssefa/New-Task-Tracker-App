//
//  ListOfTasksTableViewCell.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import UIKit

protocol ListOfTasksTableViewCellDelegate {
    func didTapAddButton(_ cell: ListOfTasksTableViewCell)
    func deleteTask(_ cell: ListOfTasksTableViewCell)
}


class ListOfTasksTableViewCell: UITableViewCell {
    
    let button = UIButton()
    let textView = UITextView()
    let deleteButton = UIButton()
    var delegate: ListOfTasksTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Colors.backgroundColor
        setupTextView()
        // Initialization code
    }

 
   
    
    func setupTextView(){
        
        //Setting up button
        
        
        button.setImage(Images.task, for: .normal)
        deleteButton.setImage(Images.deletTtask, for: .normal)
        deleteButton.tintColor = .systemRed
        deleteButton.contentVerticalAlignment = .center
        deleteButton.contentHorizontalAlignment = .center

        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up textfield
        
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 17, weight: .bold)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = true
 
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [button,textView,deleteButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        contentView.addSubview(stackView)
 
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 128),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            
        ])
      
    }
    
    @objc func addTask(){
        delegate?.didTapAddButton(self)
    }
    @objc func deleteTask(){
        delegate?.deleteTask(self)
    }
}
