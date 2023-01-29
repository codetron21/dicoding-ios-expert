//
//  DetailInteractor.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import RxSwift

protocol DetailUseCase: AnyObject {
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: AnimeRepositoryProtocol

    required init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel> {
        return repository.getDetailAnime(id: id)
    }
    
}
