//
//  SceneDelegate.swift
//  HouseAppClip
//
//  Created by User on 5/23/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let appWindow = UIWindow(frame: scene.coordinateSpace.bounds)
        appWindow.windowScene = scene
        
        let menuVC = MenuViewController()
        menuVC.navigationItem.title = "Menu"
        let navVC = UINavigationController(rootViewController: menuVC)

        appWindow.rootViewController = navVC
        appWindow.makeKeyAndVisible()
        window = appWindow
        
        handleClipUrl(options: connectionOptions, navigationController: navVC)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

// MARK: - An activity that continues from Handoff or a universal link

extension SceneDelegate {
    private func handleClipUrl(options connectionOptions: UIScene.ConnectionOptions,
                               navigationController: UINavigationController) {
        guard let userActivity = connectionOptions.userActivities.first,
              userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL,
              let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return
        }
        
        guard let item = queryItems.first(where: { $0.name == "productID" }),
              let furniture = MockFurniture.shared.furnitures.first(where: { $0.imageName == item.value })
        else {
            return
        }
        navigationController.pushViewController(DetailViewController(furniture: furniture), animated: true)
    }
}
