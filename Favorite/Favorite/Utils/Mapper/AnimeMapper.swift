//
//  AnimeMapper.swift
//  Favorite
//
//  Created by Apple on 04/02/23.
//

import Foundation
import Core
import Detail

final class AnimeMapper {
    
    private init() {}
    
    static func mapAnimeEntityToDomain(
        input: [AnimeEntity]
    ) -> [ItemAnimeModel] {
        return input.map { result in
            return ItemAnimeModel(id: result.id, title: result.title, imageUrl: result.imageUrl)
        }
    }
    
}
