//
//  RemoteDataSource.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: AnyObject {
    func getTopAnime() -> Observable<[ItemAnimeResponse]>
}

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    static let shared = RemoteDataSource()
    
    private init() {  }
    
    func getTopAnime() -> Observable<[ItemAnimeResponse]> {
        return Observable<[ItemAnimeResponse]>.create { observer in
            let url = URL(string: Endpoints.Gets.top.url)
            
            guard let url = url else {
                print("ERROR: remote url")
                observer.onError(URLError.invalidAddress)
                return Disposables.create()
            }
            
            AF.request(url)
                .validate()
                .responseDecodable(of: ListAnimeResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value.data)
                        observer.onCompleted()
                    case .failure:
                        observer.onError(URLError.invalidResponse)
                    }
                }
            
            return Disposables.create()
        }
    }
}

