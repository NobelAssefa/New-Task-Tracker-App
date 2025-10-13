//
//  MainViewTabBarController.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//

import UIKit

class MainViewTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = Colors.primaryColor
        setingUpTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setingUpTabBar(){
        viewControllers = [
            createNavBarController(title: "Tasks", image: Images.tabBarListIcon!, viewController: ListOfTasksViewController()),
            
            createNavBarController(title: "Status", image: Images.tabBarStatusIcon!, viewController: StatusViewController())
        ]
  
    }
    
    func createNavBarController(title:String,image:UIImage, viewController: UIViewController)->UINavigationController{
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
