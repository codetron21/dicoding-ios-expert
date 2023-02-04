//
//  RemoteDataSource.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import Alamofire
import RxSwift
import Core

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
                .responseDecodable(of: WrapperResponse<[ItemAnimeResponse]>.self) { response in
                    switch response.result {
                    case .success(let value):
                        let data = value.data ?? []
                        print("DEBUG: remote result \(data)")
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure:
                        if let data = response.data {
                            let errMessage = self.decodeError(data)
                            print("DEBUG: remote result \(errMessage)")
                            observer.onError(URLError.errorResponse(errMessage))
                        } else {
                            observer.onError(URLError.invalidResponse)
                        }
                    }
                }
            
            return Disposables.create()
        }
    }
    
    private func decodeError(_ data: Data) -> String {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(ErrorResponse.self, from: data) {
            return result.message ?? "Failed to decode response"
        } else {
            return "Something gone wrong"
        }
    }
}

