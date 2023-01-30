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
    
    init(id: Int, title: String, type: String, status: String, episodes: Int, description: String, imageUrl: String, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.type = type
        self.status = status
        self.episodes = episodes
        self.description = description
        self.imageUrl = imageUrl
        self.isFavorite = isFavorite
    }
    
    func copy(id: Int? = nil, title: String? = nil, type: String? = nil, status: String? = nil, episodes: Int? = nil, description: String? = nil, imageUrl: String? = nil, isFavorite: Bool?) -> DetailAnimeModel {
        return DetailAnimeModel(id: id ?? self.id, title: title ?? self.title, type: type ?? self.type, status: status ?? self.status, episodes: episodes ?? self.episodes, description: description ?? self.description, imageUrl: imageUrl ?? self.imageUrl, isFavorite: isFavorite ?? self.isFavorite)
    }
    
}
