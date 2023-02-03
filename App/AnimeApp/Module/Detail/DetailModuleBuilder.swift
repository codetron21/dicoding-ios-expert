//
//  DetailModuleBuilder.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit

final class DetailModuleBuilder {
    
    private init() {}
    
    static func build(id: Int) -> UIViewController {
        let detailVc = DetailViewController()
        detailVc.id = id
        return detailVc
    }
    
}
