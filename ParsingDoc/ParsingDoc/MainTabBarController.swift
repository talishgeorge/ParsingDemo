//
//  MainTabBarController.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // Mark: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureViewControllers()
    }
    
    func configureViewControllers() {
        
        let home = templateNavigationController(unSelectedImage: #imageLiteral(resourceName: "home_selected"), selectedImage: #imageLiteral(resourceName: "home_unselected-1"), rootViewController: HomeViewController())
        
        viewControllers = [home]
    }
    
    func templateNavigationController(unSelectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unSelectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .black
        return navController
    }
    
}
