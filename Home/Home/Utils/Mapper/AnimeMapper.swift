//
//  AnimeMapper.swift
//  Home
//
//  Created by Apple on 04/02/23.
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
    
    
}
