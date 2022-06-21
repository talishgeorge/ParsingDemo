//
//  AppCoordinator.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation
import UIKit

enum CoordinatorType {
    case app, login, tab
}

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    func start()
}

protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showMainFlow()
}

final class AppCoordinator: Coordinator, AppCoordinatorProtocol {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showLoginFlow() {
        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        var type: CoordinatorType { .app }
        
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showMainFlow() {
        // Implement Main (Tab bar) FLow
    }
    
    func start() {
        showLoginFlow()
    }
}


