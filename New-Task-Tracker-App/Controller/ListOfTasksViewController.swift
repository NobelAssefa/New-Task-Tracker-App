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
    var stackView = UIStackView()
    let button1 = UIButton(type: .system)
    let textField1 = UITextField()
    
    var filterStackView = UIStackView()
    let filterButton = UIButton(type: .system)
    let sortButton = UIButton(type: .system)
    
    let tableView = UITableView()
    let themeButton = UIButton(type: .system)
    
    let viewModel = ListOfTasksViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.dataSource = viewModel.tasks.tasks
        
        setUpHalfViewController()
        setupLable()
        setupthemeButton()
        setupFilterButton()
        setUpStackView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpStackView()
        setuptableview()
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
    
    func setupFilterButton(){
        sortButton.setImage(Images.arrow_up_arrow_down, for: .normal)
        filterButton.setImage(Images.sortingButtonIcon, for: .normal)
//        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
//        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.tintColor = Colors.primaryColor
        sortButton.tintColor = Colors.primaryColor
        let uiView = UIView()
        filterStackView.axis = .horizontal
        filterStackView = UIStackView(arrangedSubviews: [uiView,filterButton,sortButton])
        
        uiView.translatesAutoresizingMaskIntoConstraints = false
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterStackView)
        NSLayoutConstraint.activate([
            
            sortButton.heightAnchor.constraint(equalToConstant: 35),
            sortButton.widthAnchor.constraint(equalToConstant: 80),
            filterButton.heightAnchor.constraint(equalToConstant: 35),
            filterButton.widthAnchor.constraint(equalToConstant: 80),
            
            filterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterStackView.topAnchor.constraint(equalTo: halfView.bottomAnchor,constant: 10)
        ])
        
        
    }
    func setupthemeButton(){
        
        themeButton.setImage(Images.sun_max, for: .normal)
        themeButton.tintColor = .white
        themeButton.translatesAutoresizingMaskIntoConstraints = false
//        themeButton.addTarget(self, action: #selector(setLighttheme), for: .touchUpInside)
        view.addSubview(themeButton)
        
        NSLayoutConstraint.activate([
            themeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            themeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
    }
    
    func setUpStackView(){ //50*35
        
        
        button1.setImage(Images.addTaskIcon, for: .normal)
//        button1.addTarget(self, action: #selector(addTask), for: .touchUpInside)
//        
        button1.layer.cornerRadius = 10
        button1.tintColor = Colors.primaryColor
        button1.translatesAutoresizingMaskIntoConstraints = false
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.placeholder = " Add Task"
        textField1.backgroundColor = .systemGray5
        textField1.layer.cornerRadius = 10
        
        stackView.axis = .horizontal
        stackView = UIStackView(arrangedSubviews: [textField1,button1])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            button1.heightAnchor.constraint(equalToConstant: 35),
            button1.widthAnchor.constraint(equalToConstant: 80),
            textField1.heightAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.topAnchor.constraint(equalTo: filterStackView.bottomAnchor,constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10)
            
        ])

        
    }
    
    func setuptableview(){
        
        let nib = UINib(nibName: "ListOfTasksTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}

