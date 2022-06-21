//
//  LoginCoordinator.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation
import UIKit

protocol ParentCoordinator {
    func childDidFinish(_ childCoordinator: Coordinator)
}

final class LoginCoordinator: Coordinator, ParentCoordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinator = self// enable the viewmodel to trigger the coordinator navigate to home
        loginViewController.viewModel = loginViewModel
        
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func tappedHomeButton() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.parentCoordinator = self
        homeCoordinator.start()
        
//        let homeCoordinator = TabBarCoordinator(navigationController: navigationController)
//        childCoordinators.append(homeCoordinator)
//        homeCoordinator.parentCoordinator = self
//        homeCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool
            in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
