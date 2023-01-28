//
//  CustomError+Ext.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

enum URLError: LocalizedError {
    
    case invalidAddress
    case invalidResponse
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidAddress: return "The address is invalid"
        case .invalidResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
    
}
