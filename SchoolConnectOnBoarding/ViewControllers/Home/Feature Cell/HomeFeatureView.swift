//
//  HomeFeatureView.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/18/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class HomeFeatureView: UIView {

    
    //MARK: - Properties
    
    
    //MARK: - UI Elements
    
    
    //MARK: - StackView
    
    
    
    //MARK: - Init
    func customizeUI(){
        
        
    }
    override func layoutSubviews() {
        makeRoundCorners()
    }
    
    //MARK: - Methods
    
    
    
    
    func makeRoundCorners(){
        self.layer.cornerRadius = 20.0
        self.layer.masksToBounds = true
    }
    
    

}
