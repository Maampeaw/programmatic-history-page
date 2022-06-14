//
//  SceneDelegate.swift
//  historyPageCode
//
//  Created by user on 6/14/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            
            let viewController = ViewController()
            viewController.title = "Home"
            let sendVc = SendViewController()
            sendVc.title = "Send"
            let historyVc = HistoryViewController()
            historyVc.title = "History"
            let scheduledVc = ScheduledViewController()
            scheduledVc.title = "Scheduled"
            
            
            let tabBarVc = UITabBarController()
            tabBarVc.setViewControllers([viewController, sendVc, historyVc, scheduledVc], animated: false)
            guard let items = tabBarVc.tabBar.items else {
                return
            }
            
            for item in items{
                guard let index = items.firstIndex(of: item) else{
                    return
                }
                
                switch index {
                case 0: item.image = UIImage(systemName: "house")
                case 1: item.image = UIImage(named: "money")
                case 2: item.image = UIImage(systemName: "note.text")
                case 3: item.image = UIImage(named: "calender")
                default:
                    item.image = UIImage(systemName: "heart.fill")
                }
            }
            window.rootViewController = tabBarVc
            
            
            
            window.makeKeyAndVisible()
            self.window = window
            
        }
        
      
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

