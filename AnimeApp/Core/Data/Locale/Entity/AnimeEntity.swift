//
//  AnimeEntity.swift
//  AnimeApp
//
//  Created by Apple on 30/01/23.
//

import Foundation
import RealmSwift

class AnimeEntity: Object {
    
    @objc dynamic var id: Int = -1
    @objc dynamic var title: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var episodes: Int = 0
    @objc dynamic var synopsis: String = ""
    @objc dynamic var imageUrl: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
}
