//
//  RemoteDataSource.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

protocol RemoteDataSourceProtocol: AnyObject {
    
}

final class RemoteDataSource : RemoteDataSourceProtocol {
    
    static let shared = RemoteDataSource()
    
    private init() {  }

}

