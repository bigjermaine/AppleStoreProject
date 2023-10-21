//
//  AppsPageHeader.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 13/10/2023.
//

import Foundation
import UIKit

class AppsPageHeader:UICollectionReusableView {
    
  
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let horinzontalControlller = HorinzontalHeaderViewController(collectionViewLayout: UICollectionViewFlowLayout())
     override init(frame: CGRect) {
         super.init(frame: frame)
     
    
        
        
         horinzontalControlller.view.translatesAutoresizingMaskIntoConstraints = false
         addSubview(horinzontalControlller.view)
         
         NSLayoutConstraint.activate([
             horinzontalControlller.view.topAnchor.constraint(equalTo:topAnchor, constant: 0),
             horinzontalControlller.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant:0),
             horinzontalControlller.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant:0),
             horinzontalControlller.view.bottomAnchor.constraint(equalTo: bottomAnchor)
             
         ])
     }
     
     
 }


