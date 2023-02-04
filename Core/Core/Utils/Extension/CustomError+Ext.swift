//
//  CustomError+Ext.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

public enum URLError: LocalizedError {
    
    case errorResponse(String)
    case invalidAddress
    case invalidResponse
    case addressUnreachable(URL)
    
    public var errorDescription: String? {
        switch self {
        case .errorResponse(let message): return message
        case .invalidAddress: return "The address is invalid"
        case .invalidResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
    
}

public enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed
  
    public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }

}
