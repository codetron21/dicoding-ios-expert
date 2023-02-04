//
//  DetailModuleBuilder.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import UIKit

public final class DetailModuleBuilder {
    
    private init() {}
    
    public static func build(id: Int) -> UIViewController {
        let detailVc = DetailViewController()
        detailVc.id = id
        return detailVc
    }
    
}
