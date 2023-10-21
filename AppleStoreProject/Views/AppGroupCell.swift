//
//  AppGroupCell.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 12/10/2023.
//


import Foundation
import UIKit


class AppgroupCell:UICollectionViewCell {
    
    let label:UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
        
       return label
    }()
    
   let horinzontalControlller = HorizontalViewController(collectionViewLayout: UICollectionViewFlowLayout())
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(label)
       
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant:10),
            label.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        horinzontalControlller.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horinzontalControlller.view)
        
        NSLayoutConstraint.activate([
            horinzontalControlller.view.topAnchor.constraint(equalTo:label.bottomAnchor, constant: 5),
            horinzontalControlller.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant:5),
            horinzontalControlller.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-5),
            horinzontalControlller.view.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
