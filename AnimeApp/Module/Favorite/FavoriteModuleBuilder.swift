//
//  FavoriteModuleBuilder.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit

final class FavoriteModuleBuilder {
    
    private init() {}
    
    static func build() -> UIViewController {
        return FavoriteViewController()
    }
    
}
