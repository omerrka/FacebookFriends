//
//  LoginScreenViewController.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 5.05.2023.
//

import UIKit

final class LoginScreenViewController: UIViewController {
    
    private let loginScreenView = LoginScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginScreenView)
        loginScreenView.delegate = self
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            loginScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginScreenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            loginScreenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LoginScreenViewController: LoginScreenViewDelegate {
    func pushViewController() {
        let vc = FriendsListViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

