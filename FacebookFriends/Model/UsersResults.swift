//
//  UsersResults.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import Foundation

struct MyResults: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}
