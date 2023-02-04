//
//  AnimeRepository.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol AnimeRepositoryProtocol: AnyObject {
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel>
    func saveAnime(from anime: DetailAnimeModel) -> Single<Bool>
    func removeAnime(from id: Int) -> Single<Bool>
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool>
}

final class AnimeRepository {
    
    typealias AnimeInstance = (RemoteDataSourceProtocol, LocaleDataSourceProtocol) -> AnimeRepository
    
    fileprivate let remote: RemoteDataSourceProtocol
    fileprivate let locale: LocaleDataSourceProtocol
    
    private init (remote: RemoteDataSourceProtocol, locale: LocaleDataSourceProtocol) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: AnimeInstance = { remoteData, localeData in
        return AnimeRepository(remote: remoteData, locale: localeData)
    }
    
}

extension AnimeRepository: AnimeRepositoryProtocol {
    
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel> {
        return self.remote.getDetailAnime(id: id)
            .map { AnimeMapper.mapAnimeResponseToDomain(input: $0) }
            
    }
    
    func saveAnime(from anime: DetailAnimeModel) -> Single<Bool> {
        return self.locale.saveAnime(from: AnimeMapper.mapAnimeDomainToEntity(input: anime))
    }
    
    func removeAnime(from id: Int) -> Single<Bool> {
        return self.locale.removeAnime(from: id)
    }
    
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool> {
        return self.locale.checkAnimeIsFavorited(from: id)
    }
    
}
