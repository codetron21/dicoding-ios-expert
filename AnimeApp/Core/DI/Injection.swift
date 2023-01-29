//
//  Injection.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import UIKit

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
    
}
