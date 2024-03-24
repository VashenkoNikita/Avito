//
//  SceneDelegate.swift
//  Avito
//
//  Created by Nikita on 13.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
       
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)

        let rootViewController = MainCoordinator(navigationController: navigationController)
        rootViewController.start(animated: false)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
