//
//  ApiCall.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

public struct API {

  static let baseUrl = "https://api.jikan.moe/v4/"

}

public protocol Endpoint {

var url: String { get }

}

public enum Endpoints {
  
  public enum Gets: Endpoint {
    case top
    case detail(Int)
    
    public var url: String {
      switch self {
      case .top: return "\(API.baseUrl)top/anime"
      case .detail(let id): return "\(API.baseUrl)anime/\(id)"
      }
    }
  }
  
}
