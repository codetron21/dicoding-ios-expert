//
//  AppRouterProtocol.swift
//  Shared
//
//  Created by Apple on 04/02/23.
//

import UIKit

public protocol AppRouterProtocol {
    func defineNavRoot() -> UIViewController
    func navigateToDetail(with id: Int)
    func navigateToAbout()
    func navigateToFavorite()
}
