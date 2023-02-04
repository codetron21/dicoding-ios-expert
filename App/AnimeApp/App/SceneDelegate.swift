//
//  SceneDelegate.swift
//  AnimeApp
//
//  Created by Irsyad Purbha on 27/01/23.
//

import UIKit
import Shared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = AppRouter.shared.defineNavRoot()
        window?.makeKeyAndVisible()
    }
    
}

