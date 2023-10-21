//
//  HorinzontalHeaderViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 13/10/2023.
//

import UIKit
import SDWebImage
class HorinzontalHeaderViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var headerData:[SocialApp]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        collectionView.register(AppPageHeaderRowCollectionViewCell.self, forCellWithReuseIdentifier: "AppPageHeaderRowCollectionViewCell")
        
        if let layout =  collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerData?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AppPageHeaderRowCollectionViewCell", for: indexPath) as! AppPageHeaderRowCollectionViewCell
         let url = URL(string: headerData?[indexPath.row].imageUrl ?? "") 
        cell.imageView.sd_setImage(with: url)
        cell.titleLabel.text =  headerData?[indexPath.row].name
        cell.companyLabel.text =  headerData?[indexPath.row].tagline
        collectionView.reloadData()

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: view.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return.init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
