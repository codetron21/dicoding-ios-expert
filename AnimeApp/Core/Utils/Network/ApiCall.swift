//
//  ApiCall.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

struct API {

  static let baseUrl = "https://api.jikan.moe/v4/"

}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {
  
  enum Gets: Endpoint {
    case top
    
    public var url: String {
      switch self {
      case .top: return "\(API.baseUrl)top/anime"
      }
    }
  }
  
}
