//
//  FriendsListViewControllerViewModel.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit
import RealmSwift

protocol FriendsListViewVMDelegate: AnyObject {
    func reloadCollectionView()
    func didSelectUser(_ user: UsersResults)
}

final class FriendsListViewViewModel: NSObject {
    private var usersResults: [UsersResults] = [] {
        didSet {
            var cellViewModels: [FriendsListCollectionViewCellViewModel] = []
            for userResult in usersResults {
                let viewModel = FriendsListCollectionViewCellViewModel(
                    userName: userResult.name.first + " " + userResult.name.last,
                    userImageUrl: userResult.picture.large)
                cellViewModels.append(viewModel)
            }
            self.cellViewModels = cellViewModels
        }
    }
    
    private var cellViewModels: [FriendsListCollectionViewCellViewModel] = []
    private var realmResults: Results<SavedUsers>?
    
    public weak var delegate: FriendsListViewVMDelegate?
    
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
                strongSelf.saveUsersToRealm(usersResults.results)
                strongSelf.delegate?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
                strongSelf.loadUsersFromRealm()
            }
        })
    }
    
    private func saveUsersToRealm(_ users: [UsersResults]) {
        do {
            let realm = try Realm()
            let realmUsers = users.map { user -> SavedUsers in
                let realmUser = SavedUsers()
                realmUser.firstName = user.name.first
                realmUser.lastName = user.name.last
                realmUser.largeImageUrl = user.picture.large
                return realmUser
            }
            try realm.write {
                realm.deleteAll()
                realm.add(realmUsers)
            }
        } catch let error {
            print("Error saving users to Realm: \(error)")
        }
    }
    
    private func loadUsersFromRealm() {
        do {
            let realm = try Realm()
            let results = realm.objects(SavedUsers.self)
            realmResults = results
            var cellViewModels: [FriendsListCollectionViewCellViewModel] = []
            for result in results {
                let viewModel = FriendsListCollectionViewCellViewModel(
                    userName: result.firstName + " " + result.lastName,
                    userImageUrl: result.largeImageUrl)
                cellViewModels.append(viewModel)
            }
            self.cellViewModels = cellViewModels
            delegate?.reloadCollectionView()
        } catch let error {
            print("Error loading users from Realm: \(error)")
        }
    }
}

extension FriendsListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let results = realmResults {
            return results.count
        } else {
            return cellViewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? FriendsListCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        var viewModel: FriendsListCollectionViewCellViewModel
        
        if let results = realmResults {
            let result = results[indexPath.row]
            viewModel = FriendsListCollectionViewCellViewModel(
                userName: result.firstName + " " + result.lastName,
                userImageUrl: result.largeImageUrl)
        } else {
            let cellViewModel = cellViewModels[indexPath.row]
            viewModel = cellViewModel
        }
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(
            width: width,
            height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard !usersResults.isEmpty else { return }

        let user = usersResults[indexPath.row]
        delegate?.didSelectUser(user)
    }
}
