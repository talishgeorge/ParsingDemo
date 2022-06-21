//
//  HomeCoordinator.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: ParentCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate()
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel // Enable to remove the deallocaiton while going back
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func didFinishHomeCoordinator() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("Deallocated from home coordinator")
    }
}