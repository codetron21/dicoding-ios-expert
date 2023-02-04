//
//  Injection.swift
//  Home
//
//  Created by Apple on 04/02/23.
//

import UIKit
import Shared

public final class Injection {
    
    public static let shared = Injection()
    
    private init () {}
    
    private func provideRepository() -> AnimeRepositoryProtocol {
        let remote: RemoteDataSourceProtocol = RemoteDataSource.shared
        return AnimeRepository.sharedInstance(remote)
    }
    
    private func provideHomeUseCase() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideAppRouter(with uiVc: UIViewController) -> AppRouterProtocol {
        return uiVc.getAppRouter()
    }
    
    func provideHomePresenter(with view: HomeViewProtocol, appRouter: AppRouterProtocol) -> HomePresenterProtocol {
        let useCase = provideHomeUseCase()
        return HomePresenter(useCase: useCase, view: view, router: appRouter)
    }
    
}
