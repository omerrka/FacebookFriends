//
//  FriendsListView.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit

protocol FriendsListViewDelegate: AnyObject {
    func friendsListView(_ friendsListView: FriendsListView, didSelectUser user: UsersResults)
}

final class FriendsListView: UIView {
    public weak var delegate: FriendsListViewDelegate?
    
    private let viewModel = FriendsListViewViewModel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alpha = 1
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FriendsListCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.cellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        addConstraints()
        viewModel.loadUsersListData()
        viewModel.delegate = self
        setUpCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension FriendsListView: FriendsListViewVMDelegate {
    func didSelectUser(_ user: UsersResults) {
        delegate?.friendsListView(self, didSelectUser: user)
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
