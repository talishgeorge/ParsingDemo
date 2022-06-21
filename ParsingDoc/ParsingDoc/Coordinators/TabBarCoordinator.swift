import UIKit
enum TabBarPage {
    case home

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}

final class TabBarCoordinator: NSObject, Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {

        let pages: [TabBarPage] = [.home]
                    .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
                
                // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
         /// Set delegate for UITabBarController
         //tabBarController.delegate = self
         /// Assign page's controllers
         tabBarController.setViewControllers(tabControllers, animated: true)
         /// Let set index
         //tabBarController.selectedIndex = TabBarPage.ready.pageOrderNumber()
         /// Styling
         tabBarController.tabBar.isTranslucent = false
         
         /// In this step, we attach tabBarController to navigation controller associated with this coordanator
         navigationController.viewControllers = [tabBarController]
     }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
            let navController = UINavigationController()
            navController.setNavigationBarHidden(false, animated: false)

            navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                         image: nil,
                                                         tag: page.pageOrderNumber())

            switch page {
            case .home:
                // If needed: Each tab bar flow can have it's own Coordinator.
                let readyVC = HomeViewController()
//                readyVC.didSendEventClosure = { [weak self] event in
//                    switch event {
//                    case .ready:
//                        self?.selectPage(.steady)
//                    }
//                }
                            
                navController.pushViewController(readyVC, animated: true)
            }
            
            return navController
        }
}


// MARK: - UITabBarControllerDelegate
extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
