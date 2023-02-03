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
    func saveAnime(from anime: DetailAnimeModel) -> Single<Bool>
    func removeAnime(from id: Int) -> Single<Bool>
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: AnimeRepositoryProtocol

    required init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDetailAnime(id: Int) -> Single<DetailAnimeModel> {
        return repository.getDetailAnime(id: id)
    }
    
    func saveAnime(from anime: DetailAnimeModel) -> Single<Bool> {
        return repository.saveAnime(from: anime)
    }
    
    func removeAnime(from id: Int) -> Single<Bool> {
        return repository.removeAnime(from: id)
    }
    
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool> {
        return repository.checkAnimeIsFavorited(from: id)
    }
    
}
