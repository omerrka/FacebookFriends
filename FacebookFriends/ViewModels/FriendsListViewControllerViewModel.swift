//
//  FriendsListViewControllerViewModel.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit

final class FriendsListViewControllerViewModel {
    
    fileprivate(set) var usersResults = [Results]()
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadUsersListData() {
        
        networkManager.fetchUsersResults(completion: { [weak self] result in
            
            guard let strongSelf = self else { return }
            switch result {
            case .success(let usersResults):
                strongSelf.usersResults = usersResults.results
            case .failure(let error):
                print(error)
            }
        })
    }
}


