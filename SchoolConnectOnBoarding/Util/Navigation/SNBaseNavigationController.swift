//
//  SNBaseNavigationController.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/13/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class SNBaseNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if (self.navigationBar.barTintColor?.isLight)! {
            return .default
        }
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavigationAttributes()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Methods
    
    func setupNavigationAttributes() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        let barColor = SNDatabaseQueryManager.getSavedPrimaryColor()
        self.navigationBar.barTintColor = barColor
        if (barColor?.isLight)! {
            let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
            self.navigationBar.titleTextAttributes = textAttributes
            self.navigationBar.largeTitleTextAttributes = textAttributes
        } else {
            let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            self.navigationBar.titleTextAttributes = textAttributes
            self.navigationBar.largeTitleTextAttributes = textAttributes
        }
        
    }


}