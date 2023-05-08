//
//  FriendsListViewController.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 5.05.2023.
//

import UIKit

final class FriendsListViewController: UIViewController {
    private let friendsListView = FriendsListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Friends"
        navigationItem.setHidesBackButton(true, animated: false)
        setUpView()
    }
    
    private func setUpView() {
        friendsListView.delegate = self
        view.addSubview(friendsListView)
        NSLayoutConstraint.activate([
            friendsListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            friendsListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            friendsListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            friendsListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FriendsListViewController: FriendsListViewDelegate {
    func friendsListView(_ friendsListView: FriendsListView, didSelectUser user: UsersResults) {
        let viewModel = FriendsDetailViewViewModel(user: user)
        let detailVC = FriendsDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController((detailVC), animated: false)
    }
}
