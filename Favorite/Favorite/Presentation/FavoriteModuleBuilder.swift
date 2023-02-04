//
//  FavoriteModuleBuilder.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import UIKit

public final class FavoriteModuleBuilder {
    
    private init() {}
    
    public static func build() -> UIViewController {
        return FavoriteViewController()
    }
    
}
