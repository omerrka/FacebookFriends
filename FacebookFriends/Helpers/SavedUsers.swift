//
//  SavedUsers.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 7.05.2023.
//

import RealmSwift

class SavedUsers: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var largeImageUrl: String = ""
}
