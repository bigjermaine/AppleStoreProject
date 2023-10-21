//
//  TodayViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 06/10/2023.
//

import UIKit
import SDWebImage
class TodayViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
     let cellID = "cellID"
    
    fileprivate var appResults = [Result]()
    
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        fetch(searchText: "")
        searchBarSetup()
    }
    
    func searchBarSetup(){
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        
    }
    
    func fetch(searchText:String) {
        Services.shared.fetchItunesApps(searchText: searchText) {[weak self] results in
            DispatchQueue.main.async {
                self?.appResults = results
                self?.collectionView.reloadData()
            }
           
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        fetch(searchText: searchText)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
     
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
    
           let appResult = appResults[indexPath.row]
            cell.nameLabel.text = appResult.trackName
            cell.categoryLabel.text = appResult.primaryGenreName
            cell.ratingLabel.text =  "Rating: \(appResult.averageUserRating ?? 0 )"
            cell.imageView.sd_setImage(with:URL(string: appResult.artworkUrl100))
        if appResult.screenshotUrls.count == 1 {
            cell.screenShotImageView1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
           
        }else if appResult.screenshotUrls.count == 2 {
            cell.screenShotImageView1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            cell.screenShotImageView2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
        }else if appResult.screenshotUrls.count >= 3 {
            cell.screenShotImageView1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            cell.screenShotImageView2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            
            cell.screenShotImageView3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
        }
          
           
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
