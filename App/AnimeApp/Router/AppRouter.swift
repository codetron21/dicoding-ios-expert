//
//  AppRouter.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit
import About
import Home
import Detail
import Favorite
import Shared

class AppRouter {
    
    typealias RouterInstance = (UIViewController) -> AppRouter
    
    static let sharedInstance: RouterInstance = { uiVc in
        AppRouter(uiVc)
    }
    
    static let shared = AppRouter()
    
    private weak var uiVc: UIViewController?
    
    private init() {}
    
    private init(_ uiVc: UIViewController) {
        self.uiVc = uiVc
    }
    
}

extension AppRouter: AppRouterProtocol {
    func defineNavRoot() -> UIViewController {
        return UINavigationController(rootViewController: HomeModuleBuilder.build())
    }
    
    func navigateToDetail(with id: Int) {
        print("DEBUG: route detail id \(id)")
        uiVc?.navigationController?.pushViewController(DetailModuleBuilder.build(id: id), animated: true)
    }
    
    func navigateToAbout() {
        print("DEBUG: route about")
        uiVc?.navigationController?.pushViewController(AboutModuleBuilder.build(), animated: true)
    }
    
    func navigateToFavorite() {
        print("DEBUG: route favorite")
        uiVc?.navigationController?.pushViewController(FavoriteModuleBuilder.build(), animated: true)
    }
    
    
}
