//
//  CustomLable.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 20/10/2025.
//

import UIKit

class CustomLable: UILabel {

    var contanierLable:UILabel {
        text = "List Of Tasks"
        textColor = .white
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

}
