//
//  ViewController.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import UIKit

class ListOfTasksViewController: UIViewController {
    
    let halfView = UIView()
    let lable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHalfViewController()
        setupLable()
    }

    func setUpHalfViewController(){
        
        halfView.backgroundColor = Colors.primaryColor
        halfView.layer.cornerRadius = 20
        halfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(halfView)
        
        NSLayoutConstraint.activate([
            halfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            halfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            halfView.topAnchor.constraint(equalTo: view.topAnchor),
            halfView.widthAnchor.constraint(equalTo:  view.widthAnchor),
            halfView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    
    func setupLable(){
        
        lable.text = "List Of Tracker"
        lable.textColor = .white
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lable)
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    }
}

