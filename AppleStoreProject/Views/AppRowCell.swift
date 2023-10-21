//
//  AppRowCell.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 13/10/2023.
//

import Foundation
import UIKit

class ApprowCell:UICollectionViewCell {
    
    let label:UILabel = {
    let label = UILabel()
    label.text = "jermaine"
    label.font = .systemFont(ofSize: 16)
   
       return label
    }()
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    
    let companyLabel:UILabel = {
    let label = UILabel()
    label.text = "intc"
    label.font = .systemFont(ofSize: 8)
        
       return label
    }()
    
    
    let GetButton:UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        button.layer.cornerRadius = 16
        return button
    }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        
        let labelStackView = UIStackView(arrangedSubviews: [label,companyLabel])
        labelStackView.alignment = .leading
        labelStackView.distribution = .fill
        labelStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [imageView,labelStackView,GetButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.alignment = .center
        addSubview(stackView)
        
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalTo:heightAnchor)
            
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
