//
//  General.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

// MARK: - Base / wrapper response
public struct WrapperResponse<T: Codable>: Codable {
    public var data: T?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Image anime responses

public struct ImagesResponse: Codable {
    public var jpg: JpgResponse?
    
    enum CodingKeys: String, CodingKey {
        case jpg
    }
}

public struct JpgResponse: Codable {
    public var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
}

// MARK: - Title anime responses

public struct TitleResponse: Codable {
    public var title: String?
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}

