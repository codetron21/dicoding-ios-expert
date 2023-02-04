//
//  LocaleDataSource.swift
//  AnimeApp
//
//  Created by Apple on 30/01/23.
//

import Foundation
import RealmSwift
import RxSwift
import Core
import Detail

protocol LocaleDataSourceProtocol: AnyObject {
    func getFavoriteAnimes() -> Observable<[AnimeEntity]>
}

final class LocaleDataSource {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
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
