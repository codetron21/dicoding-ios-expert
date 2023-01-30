//
//  AnimeItemMapper.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

final class AnimeMapper {
    
    private init() {}
    
    static func mapAnimeResponseToDomains(
        input: [ItemAnimeResponse]
    ) -> [ItemAnimeModel] {
        return input.map { result in
            
            let title: String
            if result.titles.isEmpty {
                title = "Unknown"
            } else {
                title = result.titles[0].title ??  "Unknown"
            }
            
            return ItemAnimeModel(
                id: result.id ?? 0,
                title: title,
                imageUrl: result.images?.jpg?.imageUrl ?? ""
            )
        }
    }
    
    static func mapAnimeResponseToDomain(
        input: DetailAnimeResponse
    ) -> DetailAnimeModel {
        return DetailAnimeModel(id: input.id ?? -1, title: input.title ?? "Unknown", type: input.type ?? "Unknown", status: input.status ?? "Unknown", episodes: input.episodes ?? 0, description: input.description ?? "Unknown", imageUrl: input.images?.jpg?.imageUrl ?? "")
    }
    
    static func mapAnimeDomainToEntity(
        input: DetailAnimeModel
    ) -> AnimeEntity {
        let entity = AnimeEntity()
        
        entity.id = input.id
        entity.title = input.title
        entity.type = input.type
        entity.status = input.status
        entity.episodes = input.episodes
        entity.imageUrl = input.imageUrl
        entity.synopsis = input.imageUrl
        
        return entity
    }
    
    static func mapAnimeEntityToDomain(
        input: [AnimeEntity]
    ) -> [ItemAnimeModel] {
        return input.map { result in
            return ItemAnimeModel(id: result.id, title: result.title, imageUrl: result.imageUrl)
        }
    }
    
}
