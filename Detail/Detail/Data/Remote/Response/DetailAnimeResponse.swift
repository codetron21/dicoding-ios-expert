//
//  DetailAnimeResponse.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import Core

struct DetailAnimeResponse: Codable {
    var id: Int?
    var title: String?
    var type: String?
    var status: String?
    var episodes: Int?
    var description: String?
    var images: ImagesResponse?

    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case title
        case type
        case status
        case episodes
        case description = "synopsis"
        case images
    }
}
