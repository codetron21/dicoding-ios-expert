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
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel>
}

final class AnimeRepository {
    
    typealias AnimeInstance = (RemoteDataSource) -> AnimeRepository
    
    fileprivate let remote: RemoteDataSource
    
    private init (remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: AnimeInstance = { remoteRepo in
        return AnimeRepository(remote: remoteRepo)
    }
    
}

extension AnimeRepository: AnimeRepositoryProtocol {
    
    func getTopAnime() -> Observable<[ItemAnimeModel]> {
        return self.remote.getTopAnime()
            .map { AnimeMapper.mapAnimeResponseToDomains(input: $0) }
    }
    
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel> {
        return self.remote.getDetailAnime(id: id).map { AnimeMapper.mapAnimeResponseToDomain(input: $0) }
    }
    
}
