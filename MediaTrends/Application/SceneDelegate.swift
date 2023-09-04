//
//  SceneDelegate.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
        
        if !isLaunchedBefore {
            let vc = InitialViewController()
            window?.rootViewController = vc
        } else {
            //MARK: Storyboard
            // let sb = UIStoryboard(name: "Main", bundle: nil)
            //guard let vc = sb.instantiateViewController(withIdentifier: TrendViewController.identifier) as? TrendViewController else { return }
            
            //MARK: CodeBased
            let firstNav = UINavigationController(rootViewController: TrendViewController())
            let secondNav = UINavigationController(rootViewController: ProfileViewController())
            
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([firstNav, secondNav], animated: true)
            
            if let items = tabBarController.tabBar.items {
                items[0].image = UIImage(systemName: "play.rectangle.on.rectangle")
                items[0].selectedImage = UIImage(systemName: "play.rectangle.on.rectangle.fill")
                items[0].title = "HOT"
                
                items[1].image = UIImage(systemName: "person")
                items[1].selectedImage = UIImage(systemName: "person.fill")
                items[1].title = "MY Profile"
            }
            window?.rootViewController = tabBarController
        }
        window?.makeKeyAndVisible()
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

