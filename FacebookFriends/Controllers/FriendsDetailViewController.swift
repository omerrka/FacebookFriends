//
//  FriendsDetailViewController.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit

final class FriendsDetailViewController: UIViewController {
    
    private let viewModel: FriendsDetailViewViewModel
    private let friendsDetailView: FriendsDetailView

    init(viewModel: FriendsDetailViewViewModel) {
        self.viewModel = viewModel
        self.friendsDetailView = FriendsDetailView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Unsported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(friendsDetailView)
        navigationItem.title = "Friend's Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        NSLayoutConstraint.activate([
            friendsDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            friendsDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            friendsDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            friendsDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
    

   


