//
//  Injection.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation

final class Injection {
    
    static let shared = Injection()
    
    private init () {}
    
    private func provideRepository() -> AnimeRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.shared
        return AnimeRepository.sharedInstance(remote)
    }
    
    private func provideHomeUseCase() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideHomePresenter(with view: HomeViewProtocol) -> HomePresenterProtocol {
        let useCase = provideHomeUseCase()
        return HomePresenter(useCase: useCase, view: view)
    }
    
}
