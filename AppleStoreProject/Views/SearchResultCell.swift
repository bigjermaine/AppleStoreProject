//
//  SearchResultCell.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 09/10/2023.
//

import Foundation
import UIKit
import SDWebImage

class SearchResultCell:UICollectionViewCell {
    
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    
    
    let nameLabel:UILabel = {
        let iv =  UILabel()
        iv.text = "App Name"
        iv.numberOfLines = 0
        return iv
    }()
    
    
    let categoryLabel:UILabel = {
        let iv =  UILabel()
        iv.text = "Photos & Video"
        return iv
    }()
    
    
    
    let ratingLabel:UILabel = {
        let iv =  UILabel()
        iv.text = "9.26M"
        return iv
    }()
    
    let getButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        button.widthAnchor.constraint(equalToConstant: 84).isActive = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    lazy var screenShotImageView1 = self.createScreenDhotImageView()
    lazy var screenShotImageView2 = self.createScreenDhotImageView()
    lazy var screenShotImageView3 = self.createScreenDhotImageView()
    
    func createScreenDhotImageView()  -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel,categoryLabel,ratingLabel])
        
        labelStackView.axis = .vertical
    
        
        
        let ImageStackView = UIStackView(arrangedSubviews: [imageView,labelStackView,getButton])
        ImageStackView.spacing = 12
        ImageStackView.alignment = .center
        addSubview( ImageStackView)
        
    
        let screenShootStackView = UIStackView(arrangedSubviews: [screenShotImageView2,screenShotImageView1,screenShotImageView3])
       screenShootStackView.spacing = 12
       screenShootStackView.distribution = .fillEqually
       
        addSubview( screenShootStackView)

        screenShootStackView.axis = .horizontal
   
        
     
        // Assuming you have a stackView and anotherView you want to constrain it to

        
        let stackView = UIStackView(arrangedSubviews: [ ImageStackView,screenShootStackView])
        stackView.axis = .vertical
        stackView.spacing = 15
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // Activate the constraint
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])

    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
