//
//  FriendsDetailViewViewModel.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import Foundation

final class FriendsDetailViewViewModel {
    
    private let user: Results
    
    init(user: Results) {
        self.user = user
    }
    
    public var userName: String {
        user.name.first + " " + user.name.last
    }
    
    public var userImageURL: String {
        user.picture.large
    }
    
    public var userCountry: String {
        user.location.country
    }
    
    public var userEmail: String {
        user.email
    }
    
    public var userLocation: String {
        user.location.city + " " + user.location.state + " " + user.location.country
    }
    
    public var userStreet: String {
        user.location.street.name + " " + String(user.location.street.number)
    }
    
    public var userTimeZone: String {
        "Time zone: " + user.location.timezone.description
    }
    
    public var userGender: String {
        user.gender.capitalized
    }
    
    public var userDob: String {
        user.dob.date.prefix(10) + " - Age: " + String(user.dob.age)
    }
    
    public var userPhone: String {
        "Phone Number: " + String(user.phone)
    }
}
