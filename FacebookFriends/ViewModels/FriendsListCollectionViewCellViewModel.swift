//
//  FriendsListCollectionViewCellViewModel.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import Foundation

final class FriendsListCollectionViewCellViewModel {
    
    public let userName: String
    public let userImageUrl: String
    
    init(
        userName: String,
        userImageUrl: String
    ) {
        self.userName = userName
        self.userImageUrl = userImageUrl
        
    }
}
