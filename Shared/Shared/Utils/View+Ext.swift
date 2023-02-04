//
//  View+Ext.swift
//  Shared
//
//  Created by Apple on 04/02/23.
//

import UIKit

extension UIViewController {
    public func getAppRouter() -> AppRouterProtocol {
        guard let router = UIApplication.shared.delegate as? HasAppRouter else {
            fatalError("App delegate must be impelement has app router")
        }
        return router.appRouter(uiVc: self)
    }
}
