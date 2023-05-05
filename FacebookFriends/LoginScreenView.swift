//
//  LoginScreenView.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 5.05.2023.
//

import UIKit

protocol LoginScreenViewDelegate: AnyObject {
    func pushViewController()
}
    
final class LoginScreenView: UIView {
    
    public weak var delegate: LoginScreenViewDelegate?
    
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(systemName: "swift")
        return logo
    }()
    
    private let userTextField: UITextField = {
        let user =  UITextField()
        user.translatesAutoresizingMaskIntoConstraints = false
        user.layer.cornerRadius = 10
        user.layer.borderWidth = 2
        user.layer.borderColor = UIColor.systemGray4.cgColor
        user.textColor = .white
        user.tintColor = .white
        user.textAlignment = .center
        user.font = UIFont.preferredFont(forTextStyle: .title2)
        user.adjustsFontSizeToFitWidth = true
        user.minimumFontSize = 12
        user.backgroundColor = .tertiarySystemBackground
        user.autocorrectionType = .no
        user.placeholder = "Enter a username"
        return user
    }()
    
    private let passwordTextField: UITextField = {
        let password =  UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor.systemGray4.cgColor
        password.textColor = .white
        password.tintColor = .white
        password.textAlignment = .center
        password.font = UIFont.preferredFont(forTextStyle: .title2)
        password.adjustsFontSizeToFitWidth = true
        password.minimumFontSize = 12
        password.backgroundColor = .tertiarySystemBackground
        password.autocorrectionType = .no
        password.placeholder = "Enter a password"
        return password
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemGreen
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(pushFriendsListVC(sender:)), for: .touchUpInside)
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(logoImageView, userTextField ,loginButton, passwordTextField)
        addConstraints()
        addTapGestureRecognizer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            userTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            userTextField.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -48),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 48),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        self.userTextField.resignFirstResponder()
    }
    
    @objc private func pushFriendsListVC(sender: UIButton) {
        delegate?.pushViewController()
    }
}
