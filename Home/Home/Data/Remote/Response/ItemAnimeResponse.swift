//
//  ListAnime.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import Core

struct ItemAnimeResponse: Codable {
    var id: Int?
    var titles: [TitleResponse]
    var images: ImagesResponse?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case titles
        case images
    }

}

