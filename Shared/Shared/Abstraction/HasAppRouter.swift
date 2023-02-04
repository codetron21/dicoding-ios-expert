//
//  HasAppRouter.swift
//  Shared
//
//  Created by Apple on 04/02/23.
//

import UIKit

public protocol HasAppRouter {
    func appRouter(uiVc: UIViewController) -> AppRouterProtocol
}
