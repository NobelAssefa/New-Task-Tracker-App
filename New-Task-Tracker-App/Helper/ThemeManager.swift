//
//  ThemeManager.swift
//  New-Task-Tracker-App
//
//  Created by Abel Assefa on 13/10/2025.
//


import Foundation
import UIKit



class ThemeManager{
    static let themeManager = ThemeManager()
    private init() {}
    
    func applyTheme(_ theme:Theme){
        
        //app's currently connected scenes
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        
        //windows may contian multiple windows that is connected to a single scene
        let windows = windowScene.windows
        
        switch theme{
        case .light:
           
            windows.forEach {$0.overrideUserInterfaceStyle = .light}
        case .dark:
            windows.forEach {$0.overrideUserInterfaceStyle = .dark}
        }
        
    }
     
}
