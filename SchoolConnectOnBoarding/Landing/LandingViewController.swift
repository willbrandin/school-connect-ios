//
//  LandingViewController.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/10/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

protocol LandingPageDelegate: class {
    func didTapContinue()
}

class LandingViewController: UIViewController {

    //MARK - Properties
    var landingView: LandingScreenView!
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLandingView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }

    //MARK: - Methods
    func setupLandingView(){
        landingView = LandingScreenView()
        landingView.customizeUI()
        landingView.delegate = self
        self.view.addSubview(landingView)
        
        landingView.translatesAutoresizingMaskIntoConstraints = false
        landingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        landingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        landingView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        landingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

extension LandingViewController: LandingPageDelegate {
    
    func didTapContinue() {
        let searchVC = SearchViewController()
        show(searchVC, sender: nil)
    }
    
}
