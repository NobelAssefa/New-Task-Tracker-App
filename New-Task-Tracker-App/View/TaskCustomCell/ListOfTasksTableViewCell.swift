//
//  ListOfTasksTableViewCell.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import UIKit

protocol ListOfTasksTableViewCellDelegate {
    func didTapAddButton(_ cell: ListOfTasksTableViewCell)
}


class ListOfTasksTableViewCell: UITableViewCell {
    
    let button = UIButton()
    let textView = UITextView()
    
    var delegate: ListOfTasksTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpButton()
        setupTextView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUpButton(){
        let image = UIImage(systemName: "circle")
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupTextView(){
      
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 17, weight: .bold)
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = true
        textView.backgroundColor =  Colors.backgroundColor
        contentView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           
            textView.heightAnchor.constraint(equalToConstant: 128),
            textView.leftAnchor.constraint(equalTo: button.rightAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            textView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5)
            
        ])
    }
    
    @objc func addTask(){
        delegate?.didTapAddButton(self)
    }
}
