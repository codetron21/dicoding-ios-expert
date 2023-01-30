//
//  FavoriteInteractor.swift
//  AnimeApp
//
//  Created by Apple on 30/01/23.
//

import Foundation
import RxSwift

protocol FavoriteUseCase: AnyObject {
    func getFavoriteAnimes() -> Observable<[ItemAnimeModel]>
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: AnimeRepositoryProtocol

    required init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavoriteAnimes() -> Observable<[ItemAnimeModel]> {
        return repository.getFavoriteAnimes()
    }
    
}
