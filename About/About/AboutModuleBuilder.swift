//
//  AboutModuleBuilder.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit

public final class AboutModuleBuilder {
    
    private init() {}
    
    public static func build() -> UIViewController {
        return AboutViewController()
    }
    
}
