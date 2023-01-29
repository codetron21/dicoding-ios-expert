//
//  DetailAnimeModel.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation

struct DetailAnimeModel {
    let id: Int
    let title: String
    let type: String
    let status: String
    let episodes: Int
    let description: String
    let imageUrl: String
    
    var isFavorite: Bool = false
    
    init(id: Int, title: String, type: String, status: String, episodes: Int, description: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.type = type
        self.status = status
        self.episodes = episodes
        self.description = description
        self.imageUrl = imageUrl
    }
}
