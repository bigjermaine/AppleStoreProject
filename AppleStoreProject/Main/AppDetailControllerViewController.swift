//
//  AppDetailControllerViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 21/10/2023.
//

import UIKit

class AppDetailControllerViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    
    
    var appID:String! {
        didSet{
            Services.shared.fetchDetails(id: appID) { SearchResult in
                print(SearchResult)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: "AppDetailCell1")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppDetailCell1", for: indexPath) as! AppDetailCell
     
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
