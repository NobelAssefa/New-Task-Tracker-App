//
//  StatusViewController.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import UIKit

class StatusViewController: UIViewController {

    
    let mainView = UIView()
    let lable = UILabel()
    let halfView = UIView()
    let viewOne = UIView()
    let viewTwo = UIView()
    let viewThree = UIView()
    let viewFour = UIView()
    
    var totalTask = 0
    var activeTask = 0
    var completedTasks = 0
    var complationpercentage: Double = 0
    let viewModel = ListOfTasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatistics()
        setUpHalfViewController()
        setupLable()
        setupView()
        setUpViewOne()
        setUpViewTwo()
        setUpViewThree()
        setUpViewFour()

      
    }
    
    func setupStatistics(){
        totalTask =  viewModel.tasks.listAllTasks().count
        activeTask = viewModel.tasks.listAllTasks().filter { $0.isCompleted == false }.count
        completedTasks = viewModel.tasks.listAllTasks().filter { $0.isCompleted == true }.count
        complationpercentage = (Double(completedTasks) / Double(totalTask)) * 100
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
        
        lable.text = "Status Of Tracker"
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
    
    func setupView(){
   
        mainView.translatesAutoresizingMaskIntoConstraints = false
     
        view.addSubview(mainView)
        
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: halfView.bottomAnchor,constant: 20),
           
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 554)
        ])
    }

    func setUpViewOne(){
        let label1 = UILabel()
        let label2 = UILabel()
        label1.text = String(viewModel.tasks.listAllTasks().count)
        label2.text = "Total Tasks"
        label1.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label2.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        label1.textColor = .white
        label2.textColor = .white
        
        viewOne.layer.cornerRadius = 10
        viewOne.clipsToBounds = true
        viewOne.backgroundColor = Colors.secondaryColor
        viewOne.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewOne)
        view.addSubview(label1)
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            
            label1.centerXAnchor.constraint(equalTo: viewOne.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: viewOne.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: viewOne.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            
            viewOne.topAnchor.constraint(equalTo: mainView.topAnchor),
            viewOne.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 5),
            viewOne.widthAnchor.constraint(equalToConstant: 193),
            viewOne.heightAnchor.constraint(equalToConstant: 193)
        ])
    }
    
    func setUpViewTwo(){
        let label1 = UILabel()
        let label2 = UILabel()
        label1.text = String(viewModel.tasks.listAllTasks().filter { $0.isCompleted == true }.count)
        label2.text = "Active Tasks"
        label1.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label2.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        label1.textColor = .white
        label2.textColor = .white
        
        viewTwo.layer.cornerRadius = 10
        viewTwo.clipsToBounds = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
       
        viewTwo.backgroundColor = Colors.secondaryColor
        viewTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTwo)
        view.addSubview(label1)
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: viewTwo.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: viewTwo.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: viewOne.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            
//            viewTwo.topAnchor.constraint(equalTo: viewOne.bottomAnchor, constant: 50),
            viewTwo.leadingAnchor.constraint(equalTo: viewOne.leadingAnchor),
            viewTwo.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
          
            viewTwo.widthAnchor.constraint(equalToConstant: 193),
            viewTwo.heightAnchor.constraint(equalToConstant: 193)
        ])
    }
    
    func setUpViewThree(){
        
        let label1 = UILabel()
        let label2 = UILabel()
        label1.text = String(viewModel.tasks.listAllTasks().filter { $0.isCompleted == false }.count)
        label2.text = "Active Tasks"
        label1.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label2.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        label1.textColor = .white
        label2.textColor = .white
        
        viewThree.layer.cornerRadius = 10
        viewThree.clipsToBounds = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
       
        viewThree.backgroundColor = Colors.secondaryColor
        viewThree.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewThree)
        view.addSubview(label1)
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            
            label1.centerXAnchor.constraint(equalTo: viewThree.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: viewThree.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: viewThree.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            
            viewThree.topAnchor.constraint(equalTo: mainView.topAnchor),
            viewThree.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -5),
            
          
            viewThree.widthAnchor.constraint(equalToConstant: 193),
            viewThree.heightAnchor.constraint(equalToConstant: 193)
        ])
    }
    
    func setUpViewFour(){
        
        let label1 = UILabel()
        let label2 = UILabel()
        label1.text = String(complationpercentage)
        label2.text = "Active Tasks"
        label1.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label2.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        label1.textColor = .white
        label2.textColor = .white
        
        viewFour.layer.cornerRadius = 10
        viewFour.clipsToBounds = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
       
        viewFour.backgroundColor = Colors.secondaryColor
        
        viewFour.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewFour)
        view.addSubview(label1)
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            
            label1.centerXAnchor.constraint(equalTo: viewFour.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: viewFour.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: viewFour.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            
//            viewFour.topAnchor.constraint(equalTo: viewThree.bottomAnchor, constant: 20),
            viewFour.trailingAnchor.constraint(equalTo: viewThree.trailingAnchor),
            viewFour.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
          
            viewFour.widthAnchor.constraint(equalToConstant: 193),
            viewFour.heightAnchor.constraint(equalToConstant: 193)
        ])
    }

}
