//
//  ErrorResponse.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation

public struct ErrorResponse: Codable {
    public var message: String?
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
