//
//  AnimeItemModel.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

struct ItemAnimeModel {
    let id: Int
    let title: String
    let imageUrl: String
    
    init(id: Int, title: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }
}
