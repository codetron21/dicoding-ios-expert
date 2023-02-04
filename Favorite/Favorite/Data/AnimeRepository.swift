//
//  AnimeRepository.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol AnimeRepositoryProtocol: AnyObject {
    func getFavoriteAnimes() -> Observable<[ItemAnimeModel]>
}

final class AnimeRepository {
    
    typealias AnimeInstance = (LocaleDataSourceProtocol) -> AnimeRepository
    
    fileprivate let locale: LocaleDataSourceProtocol
    
    private init (locale: LocaleDataSourceProtocol) {
        self.locale = locale
    }
    
    static let sharedInstance: AnimeInstance = { localeData in
        return AnimeRepository(locale: localeData)
    }
    
}

extension AnimeRepository: AnimeRepositoryProtocol {
    
    func getFavoriteAnimes() -> Observable<[ItemAnimeModel]> {
        return self.locale.getFavoriteAnimes()
            .map { AnimeMapper.mapAnimeEntityToDomain(input: $0) }
    }
    
}
