//
//  SceneDelegate.swift
//  MVVM + Coordinator
//
//  Created by Aliaksandr Hunko on 03/11/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: LoginCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let coordinator = LoginCoordinator(rootNavigationController: navigationController)
        coordinator.start()
        mainCoordinator = coordinator
    }
}

