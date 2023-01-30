//
//  LocaleDataSource.swift
//  AnimeApp
//
//  Created by Apple on 30/01/23.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol: AnyObject {
    func getFavoriteAnimes() -> Observable<[AnimeEntity]>
    func saveAnime(from anime: AnimeEntity) -> Single<Bool>
    func removeAnime(from id: Int) -> Single<Bool>
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool>
}

final class LocaleDataSource {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getFavoriteAnimes() -> Observable<[AnimeEntity]> {
        return Observable<[AnimeEntity]>.create { observer in
            guard let realm = self.realm else {
                observer.onError(DatabaseError.invalidInstance)
                return Disposables.create()
            }
            
            let data = realm.objects(AnimeEntity.self)
            observer.onNext(data.toArray(ofType: AnimeEntity.self))
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func saveAnime(from anime: AnimeEntity) -> Single<Bool> {
        return Single<Bool>.create { observer in
            guard let realm = self.realm else {
                observer(.failure(DatabaseError.invalidInstance))
                return Disposables.create()
            }
            
            do {
                try realm.write {
                    realm.add(anime)
                    observer(.success(true))
                }
            } catch {
                observer(.failure(DatabaseError.requestFailed))
            }
            
            return Disposables.create()
        }
    }
    
    func removeAnime(from id: Int) -> Single<Bool> {
        return Single<Bool>.create { observer in
            guard let realm = self.realm else {
                observer(.failure(DatabaseError.invalidInstance))
                return Disposables.create()
            }
            
            do {
                try realm.write {
                    let data = realm.object(ofType: AnimeEntity.self, forPrimaryKey: id)
                    
                    guard let data = data else {
                        throw DatabaseError.invalidInstance
                    }
                    
                    realm.delete(data)
                    observer(.success(true))
                }
            } catch {
                observer(.failure(DatabaseError.requestFailed))
            }
            
            return Disposables.create()
        }
    }
    
    func checkAnimeIsFavorited(from id: Int) -> Single<Bool> {
        return Single<Bool>.create { observer in
            guard let realm = self.realm else {
                observer(.failure(DatabaseError.invalidInstance))
                return Disposables.create()
            }
            
            let data = realm.object(ofType: AnimeEntity.self, forPrimaryKey: id)
            
            observer(.success(data != nil))
            
            return Disposables.create()
        }
    }
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
