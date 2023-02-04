//
//  Injection.swift
//  Favorite
//
//  Created by Apple on 04/02/23.
//

import Foundation
import RealmSwift
import Shared
import Core
import Detail

public final class Injection {
    
    public static let shared = Injection()
    
    private init () {}
    
    private func provideRepository() -> AnimeRepositoryProtocol {
        let realm = Detail.Injection.shared.provideRealm()
        let locale: LocaleDataSourceProtocol = LocaleDataSource.sharedInstance(realm)
        return AnimeRepository.sharedInstance(locale)
    }
    
    private func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    
    func provideAppRouter(with uiVc: UIViewController) -> AppRouterProtocol {
        return uiVc.getAppRouter()
    }
    
    func provideFavoritePresenter(with view: FavoriteViewProtocol, appRouter: AppRouterProtocol) -> FavoritePresenterProtocol {
        let useCase = provideFavoriteUseCase()
        return FavoritePresenter(useCase: useCase, view: view, router: appRouter)
    }
    
}
