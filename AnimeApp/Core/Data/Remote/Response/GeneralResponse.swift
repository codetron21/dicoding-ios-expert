//
//  General.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

// MARK: - Image anime responses

struct ImagesResponse: Codable {
    var jpg: JpgResponse?
    
    enum CodingKeys: String, CodingKey {
        case jpg
    }
}

struct JpgResponse: Codable {
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "small_image_url"
    }
}

// MARK: - Title anime responses

struct TitleResponse: Codable {
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}

