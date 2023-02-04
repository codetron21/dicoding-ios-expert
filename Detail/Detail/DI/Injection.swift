//
//  Injection.swift
//  Detail
//
//  Created by Apple on 04/02/23.
//

import Foundation
import RealmSwift
import Core

public final class Injection {
    
    public static let shared = Injection()
    
    private init () {}
    
    private func provideRepository() -> AnimeRepositoryProtocol {
        let realm = provideRealm()
        let remote: RemoteDataSourceProtocol = RemoteDataSource.shared
        let locale: LocaleDataSourceProtocol = LocaleDataSource.sharedInstance(realm)
        return AnimeRepository.sharedInstance(remote, locale)
    }
    
    private func provideDetailUseCase() -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository)
    }
    
    func provideDetailPresenter(with view: DetailViewProtocol) -> DetailPresenterProtocol {
        let useCase = provideDetailUseCase()
        return DetailPresenter(useCase: useCase, view: view)
    }
    
    public func provideRealm() -> Realm? {
        let config = Realm.Configuration(objectTypes: [AnimeEntity.self])
        let realm = try? Realm(configuration: config)
        return realm
    }
    
    
}
