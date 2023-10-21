//
//  HorizontalViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 12/10/2023.
//

import UIKit
import SDWebImage
class HorizontalViewController:UICollectionViewController,UICollectionViewDelegateFlowLayout {

    
    var editorsChoiceGames:Feed?
    
    var didSelectHandler:((FeedResult) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        collectionView.register(ApprowCell.self, forCellWithReuseIdentifier: "ApprowCell")
      
        
        if let layout =  collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.scrollDirection = .horizontal
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return editorsChoiceGames?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let app = editorsChoiceGames?.results[indexPath.row] {
            didSelectHandler?(app)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ApprowCell", for: indexPath) as! ApprowCell
        cell.label.text = editorsChoiceGames?.results[indexPath.row].artistName
        cell.companyLabel.text =  editorsChoiceGames?.results[indexPath.row].name
        cell.imageView.sd_setImage(with: URL(string: editorsChoiceGames?.results[indexPath.row].artworkUrl100 ?? ""))
        collectionView.reloadData() 
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: (view.frame.height - 60)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return.init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
