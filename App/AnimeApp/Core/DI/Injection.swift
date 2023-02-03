//
//  Injection.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import UIKit
import RealmSwift

final class Injection {
    
    static let shared = Injection()
    
    private init () {}
    
    private func provideRepository() -> AnimeRepositoryProtocol {
        let realm = try? Realm()
        let remote: RemoteDataSourceProtocol = RemoteDataSource.shared
        let locale: LocaleDataSourceProtocol = LocaleDataSource.sharedInstance(realm)
        return AnimeRepository.sharedInstance(remote, locale)
    }
    
    private func provideHomeUseCase() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    private func provideDetailUseCase() -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository)
    }
    
    private func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    
    func provideAppRouter(with uiVc: UIViewController? = nil) -> AppRouterProtocol {
        if let uiVc = uiVc {
            return AppRouter.sharedInstance(uiVc)
        } else {
            return AppRouter.shared
        }
    }
    
    func provideHomePresenter(with view: HomeViewProtocol, appRouter: AppRouterProtocol) -> HomePresenterProtocol {
        let useCase = provideHomeUseCase()
        return HomePresenter(useCase: useCase, view: view, router: appRouter)
    }
    
    func provideDetailPresenter(with view: DetailViewProtocol) -> DetailPresenterProtocol {
        let useCase = provideDetailUseCase()
        return DetailPresenter(useCase: useCase, view: view)
    }
    
    func provideFavoritePresenter(with view: FavoriteViewProtocol, appRouter: AppRouterProtocol) -> FavoritePresenterProtocol {
        let useCase = provideFavoriteUseCase()
        return FavoritePresenter(useCase: useCase, view: view, router: appRouter)
    }
    
}
