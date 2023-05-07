//
//  FriendsListViewControllerViewModel.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit

protocol FriendsListViewVMDelegate: AnyObject {
    func reloadCollectionView()
    func didSelectUser(_ user: Results)
}

final class FriendsListViewViewModel: NSObject {
    
    private var usersResults: [Results] = [] {
        didSet {
            for userResult in usersResults {
                let viewModel = FriendsListCollectionViewCellViewModel(userName: userResult.name.first + " " + userResult.name.last, userImageUrl: userResult.picture.large)
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [FriendsListCollectionViewCellViewModel] = []
    
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
                strongSelf.delegate?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

extension FriendsListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsListCollectionViewCell.cellIdentifier, for: indexPath
        ) as? FriendsListCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        let viewModel = cellViewModels[indexPath.row]
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
        let user = usersResults[indexPath.row]
        delegate?.didSelectUser(user)

    }
}
