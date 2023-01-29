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
    
}
