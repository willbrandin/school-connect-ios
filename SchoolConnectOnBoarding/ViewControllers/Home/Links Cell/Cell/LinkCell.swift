//
//  LinkCell.swift
//  SchoolConnectOnBoarding
//
//  Created by William Brandin on 3/20/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class LinkCell: UITableViewCell {

    //MARK: - Properties
    static var cellId = "LinkTableCell"
    
    //MARK: - UI Elements
    
    lazy var linkTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "Facebook".uppercased()
        label.textColor = UIColor.scGrayText()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //MARK: - Inits
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(){
        setupTitleConstraints()
    }
    
    //MARK: - Methods

    func setupTitleConstraints(){
        addSubview(linkTitleLabel)
        linkTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30.0).isActive = true
        linkTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        linkTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
