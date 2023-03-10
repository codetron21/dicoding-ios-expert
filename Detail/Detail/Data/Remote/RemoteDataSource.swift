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
    func getDetailAnime(id: Int) -> Single<DetailAnimeResponse>
}

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    static let shared = RemoteDataSource()
    
    private init() {  }
    
    func getDetailAnime(id: Int) -> Single<DetailAnimeResponse> {
        return Single<DetailAnimeResponse>.create { observer in
            let url = URL(string: Endpoints.Gets.detail(id).url)
            
            guard let url = url else {
                print("ERROR: remote url")
                observer(.failure(URLError.invalidAddress))
                return Disposables.create()
            }
            
            AF.request(url)
                .responseDecodable(of: WrapperResponse<DetailAnimeResponse>.self) {response in
                    switch response.result {
                    case .success(let value):
                        if let data = value.data {
                            print("DEBUG: remote result \(data)")
                            observer(.success(data))
                        } else {
                            observer(.failure(URLError.invalidResponse))
                        }
                    case .failure:
                        if let data = response.data {
                            let errMessage = self.decodeError(data)
                            print("DEBUG: remote result \(errMessage)")
                            observer(.failure(URLError.errorResponse(errMessage)))
                        } else {
                            observer(.failure(URLError.invalidResponse))
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

