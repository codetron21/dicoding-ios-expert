//
//  AnimeMapper.swift
//  Detail
//
//  Created by Apple on 04/02/23.
//

import Foundation
import Core

final class AnimeMapper {
    
    private init() {}
    
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
        entity.synopsis = input.description
        
        return entity
    }
    
}
