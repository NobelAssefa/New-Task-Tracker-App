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
    
    var isfilterButtonTapped = false
    var isSortButtonTapped = false
    var isthemeButtonTapped = false
    
    let viewModel = ListOfTasksViewModel()
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        viewModel.copy = viewModel.data
        setUpHalfViewController()
        setupLable()
        setupthemeButton()
        setupFilterButton()
        tableView.delegate = self
        tableView.dataSource = self
        setUpStackView()
        setuptableview()
    }
    
    
// MARK: - HalfContainer UI
    
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
    
// MARK: - ContanierLabel UI
    
    func setupLable(){
        
        lable.text = "List Of Tasks"
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
    
    // MARK: - filterButton UI
    
    func setupFilterButton(){
        sortButton.setImage(Images.arrow_up_arrow_down, for: .normal)
        filterButton.setImage(Images.sortingButtonIcon, for: .normal)
        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
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
            sortButton.widthAnchor.constraint(equalToConstant: 40),
            filterButton.heightAnchor.constraint(equalToConstant: 35),
            filterButton.widthAnchor.constraint(equalToConstant: 40),
           
            filterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterStackView.topAnchor.constraint(equalTo: halfView.bottomAnchor,constant: 10)
        ])
        
        
    }
    
    @objc func filterButtonTapped(){
        var filterdData:[Tasks] = []
        if !isfilterButtonTapped {
            
            filterdData = viewModel.copy.filter { $0.isCompleted }
            debugPrint("Completed Tasks: \(filterdData.count)")
        } else {
            filterdData = viewModel.copy.filter { !$0.isCompleted }
            debugPrint("Incomplete Tasks: \(filterdData.count)")
        }

        viewModel.data = filterdData
        debugPrint("updated Data after filter button tapped: \(viewModel.data)")
        isfilterButtonTapped.toggle()
       
        tableView.reloadData()

    }
    
   
    @objc func sortButtonTapped(){
        var sortedData:[Tasks] = []
        if(isSortButtonTapped == false){
            sortedData = viewModel.copy.sorted { $0.title < $1.title }
        }
        
        else if(isSortButtonTapped == true){
            sortedData = viewModel.copy.sorted { $0.title > $1.title }
        }
        viewModel.data = sortedData
        isSortButtonTapped.toggle()
        tableView.reloadData()
    }
    
    // MARK: - themeButton UI
    func setupthemeButton(){
        
        themeButton.setImage(Images.sun_max, for: .normal)
        themeButton.tintColor = .white
        themeButton.translatesAutoresizingMaskIntoConstraints = false
        themeButton.addTarget(self, action: #selector(setLighttheme), for: .touchUpInside)
        view.addSubview(themeButton)
        
        NSLayoutConstraint.activate([
            themeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            themeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
    }
    
    @objc func setLighttheme(){

        if(!isthemeButtonTapped){
            ThemeManager.themeManager.applyTheme(.dark)
            themeButton.setImage(Images.sun_min_fill, for: .normal)
            
        }else{
            ThemeManager.themeManager.applyTheme(.light)
            
            themeButton.setImage(Images.sun_min, for: .normal)
            
        }
        // must be toggled
        isthemeButtonTapped.toggle()
    }
    
    //MARK: - AddTask UI
    
    func setUpStackView(){ //50*35
        
        
        button1.setImage(Images.addTaskIcon, for: .normal)
        button1.addTarget(self, action: #selector(addTask), for: .touchUpInside)
//        
        button1.layer.cornerRadius = 10
        button1.tintColor = Colors.primaryColor
        button1.translatesAutoresizingMaskIntoConstraints = false
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.placeholder = " Add Task"
        textField1.backgroundColor = Colors.secondaryColor
        textField1.layer.cornerRadius = 10
        
        stackView.axis = .horizontal
        stackView = UIStackView(arrangedSubviews: [textField1,button1])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
         
            button1.widthAnchor.constraint(equalToConstant: 80),

            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.topAnchor.constraint(equalTo: filterStackView.bottomAnchor,constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10)
            
        ])

        
    }
    // MARK: - TableView UI
    func setuptableview(){
        
        let nib = UINib(nibName: "ListOfTasksTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Colors.backgroundColor
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    @objc func addTask(){
      
        let task = Tasks(title : textField1.text ?? "", isCompleted: false)
        viewModel.addTask(task)
        tableView.reloadData()
    }
    
    //MARK: - User Default functions
   
    
    
    
}

