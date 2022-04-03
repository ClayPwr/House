//
//  MainTabBarController.swift
//  House
//
//  Created by User on 4/3/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.tabBar.tintColor = .black
        setupVCs()
    }
    
    private func setupVCs() {
        viewControllers = [createNavigationController(for: MenuViewController(),
                                                         item: .bookmarks, tag: 0, title: "Menu"),
                           createNavigationController(for: FavoriteViewController(),
                                                         item: .favorites, tag: 1, title: "Favorite"),
                           createNavigationController(for: OrderHistoryViewController(),
                                                         item: .history, tag: 2, title: "History"),
                           createNavigationController(for: AboutViewController(),
                                                         item: .contacts, tag: 3, title: "About Us")
        ]
    }
    
    private func createNavigationController(for rootViewController: UIViewController,
                                            item: UITabBarItem.SystemItem,
                                            tag: Int,
                                            title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = .init(tabBarSystemItem: item, tag: tag)
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}

//MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("selceted new vc ", viewController.self)
    }
}
