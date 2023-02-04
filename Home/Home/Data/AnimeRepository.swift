//
//  AnimeRepository.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol AnimeRepositoryProtocol: AnyObject {
    func getTopAnime() -> Observable<[ItemAnimeModel]>
}

final class AnimeRepository {
    
    typealias AnimeInstance = (RemoteDataSourceProtocol) -> AnimeRepository
    
    fileprivate let remote: RemoteDataSourceProtocol
    
    private init (remote: RemoteDataSourceProtocol) {
        self.remote = remote
    }
    
    static let sharedInstance: AnimeInstance = { remoteData in
        return AnimeRepository(remote: remoteData)
    }
    
}

extension AnimeRepository: AnimeRepositoryProtocol {
    
    func getTopAnime() -> Observable<[ItemAnimeModel]> {
        return self.remote.getTopAnime()
            .map { AnimeMapper.mapAnimeResponseToDomains(input: $0) }
    }
    
}
