//
//  AnimeEntity.swift
//  Detail
//
//  Created by Apple on 04/02/23.
//

import Foundation
import RealmSwift

public final class AnimeEntity: Object {
    
    @objc public dynamic var id: Int = -1
    @objc public dynamic var title: String = ""
    @objc public dynamic var type: String = ""
    @objc public dynamic var status: String = ""
    @objc public dynamic var episodes: Int = 0
    @objc public dynamic var synopsis: String = ""
    @objc public dynamic var imageUrl: String = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
}
