//
//  AppPageHeaderRowCollectionViewCell.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 13/10/2023.
//

import UIKit

class AppPageHeaderRowCollectionViewCell: UICollectionViewCell {
    
    let companyLabel:UILabel = {
        let label = UILabel()
        label.text = "jermaine"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "jermaine"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
      label.textAlignment = .left
       return label
    }()
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false // Ensure auto layout is enabled
        iv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        iv.contentMode = .scaleAspectFill // Ensure content fills the imageView
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
      
       let stackView = UIStackView(arrangedSubviews: [companyLabel,titleLabel,imageView])
        
        
        
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fill
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalTo:heightAnchor)
            ])
        
        imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true // Set width equal
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
