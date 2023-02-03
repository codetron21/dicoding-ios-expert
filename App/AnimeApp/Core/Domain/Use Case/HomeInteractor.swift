//
//  HomeUseCase.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol HomeUseCase: AnyObject {
    func getTopAnime() -> Observable<[ItemAnimeModel]>
}

class HomeInteractor: HomeUseCase {
    
    private let repository: AnimeRepositoryProtocol
    
    required init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }
    
    func getTopAnime() -> Observable<[ItemAnimeModel]> {
        return repository.getTopAnime()
    }
}
