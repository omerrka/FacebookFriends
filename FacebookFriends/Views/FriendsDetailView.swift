//
//  FriendsDetailView.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import UIKit
import Kingfisher

final class FriendsDetailView: UIView {
    
    var friendsDetailViewViewModel: FriendsDetailViewViewModel
    
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.layer.cornerRadius = 32
        logo.clipsToBounds = true
        return logo
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 21)
        name.numberOfLines = 0
        name.textColor = .secondaryLabel
        return name
    }()
    
    private let emailLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = UIFont.italicSystemFont(ofSize: 12)
        email.numberOfLines = 0
        email.textColor = .secondaryLabel
        return email
    }()
    
    private let locationInfoFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let personalInfoFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let mainInfoFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let countryLabel: UILabel = {
        let country = UILabel()
        country.translatesAutoresizingMaskIntoConstraints = false
        country.font = UIFont.boldSystemFont(ofSize: 18)
        country.numberOfLines = 0
        country.textColor = .secondaryLabel
        return country
    }()
    
    private let locationInfoBackgroundView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 18
        background.clipsToBounds = true
        background.backgroundColor = .secondarySystemBackground
        return background
    }()
    
    private let personalInfoBackgroundView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.layer.cornerRadius = 18
        background.clipsToBounds = true
        background.backgroundColor = .secondarySystemBackground
        return background
    }()
    
    private let locationInfoTitleLabel: UILabel = {
        let locationInfoTitle = UILabel()
        locationInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        locationInfoTitle.font = UIFont.boldSystemFont(ofSize: 18)
        locationInfoTitle.numberOfLines = 0
        locationInfoTitle.textColor = .systemBlue
        return locationInfoTitle
    }()
    
    private let locationLabel: UILabel = {
        let location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.font = UIFont.boldSystemFont(ofSize: 16)
        location.numberOfLines = 0
        location.textColor = .label
        return location
    }()
    
    private let streetLabel: UILabel = {
        let street = UILabel()
        street.translatesAutoresizingMaskIntoConstraints = false
        street.font = UIFont.boldSystemFont(ofSize: 16)
        street.numberOfLines = 0
        street.textColor = .label
        return street
    }()
    
    private let timeZoneLabel: UILabel = {
        let timeZone = UILabel()
        timeZone.translatesAutoresizingMaskIntoConstraints = false
        timeZone.font = UIFont.boldSystemFont(ofSize: 14)
        timeZone.numberOfLines = 0
        timeZone.textColor = .label
        return timeZone
    }()
    
    private let personalInfoTitleLabel: UILabel = {
        let personalInfoTitle = UILabel()
        personalInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        personalInfoTitle.font = UIFont.boldSystemFont(ofSize: 18)
        personalInfoTitle.numberOfLines = 0
        personalInfoTitle.textColor = .systemBlue
        return personalInfoTitle
    }()
    
    private let genderLabel: UILabel = {
        let gender = UILabel()
        gender.translatesAutoresizingMaskIntoConstraints = false
        gender.font = UIFont.boldSystemFont(ofSize: 16)
        gender.numberOfLines = 0
        gender.textColor = .label
        return gender
    }()
    
    private let dobLabel: UILabel = {
        let dob = UILabel()
        dob.translatesAutoresizingMaskIntoConstraints = false
        dob.font = UIFont.boldSystemFont(ofSize: 16)
        dob.numberOfLines = 0
        dob.textColor = .label
        return dob
    }()
    
    private let phoneLabel: UILabel = {
        let phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.font = UIFont.boldSystemFont(ofSize: 16)
        phone.numberOfLines = 0
        phone.textColor = .label
        return phone
    }()
    
    init(viewModel: FriendsDetailViewViewModel) {
        self.friendsDetailViewViewModel = viewModel
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(logoImageView, mainInfoFieldStackView, locationInfoBackgroundView, locationInfoFieldStackView, personalInfoBackgroundView, personalInfoFieldStackView)
        configureView(with: viewModel)
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            mainInfoFieldStackView.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 30),
            mainInfoFieldStackView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 18),
            mainInfoFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            mainInfoFieldStackView.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -18),
            
            locationInfoBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            locationInfoBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            locationInfoBackgroundView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            locationInfoBackgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
            
            locationInfoFieldStackView.topAnchor.constraint(equalTo: locationInfoBackgroundView.topAnchor, constant: 8),
            locationInfoFieldStackView.leadingAnchor.constraint(equalTo: locationInfoBackgroundView.leadingAnchor, constant: 12),
            locationInfoFieldStackView.trailingAnchor.constraint(equalTo: locationInfoBackgroundView.trailingAnchor, constant: -12),
            locationInfoFieldStackView.bottomAnchor.constraint(equalTo: locationInfoBackgroundView.bottomAnchor, constant: -8),
            
            personalInfoBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            personalInfoBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            personalInfoBackgroundView.topAnchor.constraint(equalTo: locationInfoBackgroundView.bottomAnchor, constant: 48),
            personalInfoBackgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
            
            personalInfoFieldStackView.topAnchor.constraint(equalTo: personalInfoBackgroundView.topAnchor, constant: 8),
            personalInfoFieldStackView.leadingAnchor.constraint(equalTo: personalInfoBackgroundView.leadingAnchor, constant: 12),
            personalInfoFieldStackView.trailingAnchor.constraint(equalTo: personalInfoBackgroundView.trailingAnchor, constant: -12),
            personalInfoFieldStackView.bottomAnchor.constraint(equalTo: personalInfoBackgroundView.bottomAnchor, constant: -8),
        ])
    }
    
    private func configureView(with viewModel: FriendsDetailViewViewModel) {
        
        mainInfoFieldStackView.addArrangedSubview(nameLabel)
        mainInfoFieldStackView.addArrangedSubview(countryLabel)
        mainInfoFieldStackView.addArrangedSubview(emailLabel)
        
        locationInfoFieldStackView.addArrangedSubview(locationInfoTitleLabel)
        locationInfoFieldStackView.addArrangedSubview(locationLabel)
        locationInfoFieldStackView.addArrangedSubview(streetLabel)
        locationInfoFieldStackView.addArrangedSubview(timeZoneLabel)
        
        personalInfoFieldStackView.addArrangedSubview(personalInfoTitleLabel)
        personalInfoFieldStackView.addArrangedSubview(genderLabel)
        personalInfoFieldStackView.addArrangedSubview(dobLabel)
        personalInfoFieldStackView.addArrangedSubview(phoneLabel)
        
        logoImageView.kf.setImage(with: URL(string: viewModel.userImageURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        nameLabel.text = viewModel.userName
        countryLabel.text = viewModel.userCountry
        emailLabel.text = viewModel.userEmail
        locationInfoTitleLabel.text = "Location Information:"
        locationLabel.text = viewModel.userLocation
        streetLabel.text = viewModel.userStreet
        timeZoneLabel.text = viewModel.userTimeZone
        personalInfoTitleLabel.text = "Personal Information:"
        genderLabel.text = viewModel.userGender
        dobLabel.text = viewModel.userDob
        phoneLabel.text = viewModel.userPhone
    }
}
