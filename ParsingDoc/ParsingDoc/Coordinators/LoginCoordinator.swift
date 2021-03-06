//
//  LoginCoordinator.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation
import UIKit

final class LoginCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel { [weak self] in
            self?.tappedHomeButton()//Invoke home button
        }
        loginViewController.viewModel = loginViewModel
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func tappedHomeButton() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        unowned(unsafe) let childCoordinator = homeCoordinator
        homeCoordinator.onDismissed = { [weak self] in
            self?.removeChildCoordinator(childCoordinator)
        }
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
//        let homeCoordinator = TabBarCoordinator(navigationController: navigationController)
//        childCoordinators.append(homeCoordinator)
//        homeCoordinator.parentCoordinator = self
//        homeCoordinator.start()
    }
    
    func removeChildCoordinator(_ child: Coordinator) {
        guard let index = childCoordinators
            .firstIndex(where: { $0 === child }) else {
            return
        }
        childCoordinators.remove(at: index)
    }
}
