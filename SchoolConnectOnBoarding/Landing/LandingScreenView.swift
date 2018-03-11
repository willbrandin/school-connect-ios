//
//  LandingView.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/10/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class LandingScreenView: UIView {

    //MARK: - Properties
    lazy var schoolConnectTitle: UILabel! = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 28.0, weight: .bold)
        title.textColor = UIColor.snGrayText()
        title.textAlignment = .center
        title.text = "School Connect"
        title.translatesAutoresizingMaskIntoConstraints = false

        return title
    }()
    
    var schoolHouseImgView: SNCircleImage! = {
        let imageView = SNCircleImage()
        imageView.image = UIImage.landingPageIcon()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    lazy var subtitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "School News with you"
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        label.textColor = UIColor.snGrayText()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var schoolConnectDescription: UILabel! = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        label.textColor = UIColor.snGray()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var continueButton: SNRoundedButton! = {
        let button = SNRoundedButton()
        button.backgroundColor = UIColor.cfnGreen()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.formatBoldButtonTitle()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    //MARK: - Stack Views
    
    lazy var bodyTextStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(schoolConnectDescription)
        stackView.spacing = 8.0
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var landingMainStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(schoolHouseImgView)
        stackView.addArrangedSubview(bodyTextStackView)
        stackView.spacing = 10.0
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //MARK: - Methods
    
    func customizeUI() {
        backgroundColor = UIColor.white
        setupButtonConstraints()
        setupTitleConstraints()
        setupMainStackViewConstraints()
    }
    
    func setupMainStackViewConstraints() {
        addSubview(landingMainStackView)
        
        landingMainStackView.topAnchor.constraint(equalTo: schoolConnectTitle.bottomAnchor, constant: 75.0).isActive = true
        landingMainStackView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -65.0).isActive = true
        landingMainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0).isActive = true
        landingMainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0).isActive = true
        
        setupImageConstraints()
    }
    
    func setupImageConstraints() {
        schoolHouseImgView.heightAnchor.constraint(equalTo: schoolHouseImgView.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func setupTitleConstraints() {
        addSubview(schoolConnectTitle)
        schoolConnectTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25.0).isActive = true
        schoolConnectTitle.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        schoolConnectTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0).isActive = true
        schoolConnectTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0).isActive = true
    }
    
    func setupButtonConstraints() {
        addSubview(continueButton)
        continueButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        continueButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        
    }
    
}
