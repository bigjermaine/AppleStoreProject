//
//  AppsViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 06/10/2023.
//

import UIKit

class AppsViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var editorsChoiceGames:[Feed] = []
    var socailApps:[SocialApp] = []
    
    
    let activityIndicatorView:UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .white
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        aiv.translatesAutoresizingMaskIntoConstraints = false
      return aiv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        collectionView.register(AppgroupCell.self,forCellWithReuseIdentifier: "cellID")
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AppPageHeader")
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.backgroundColor = .white
        
        Services.shared.fetchSocialApps { result in
            DispatchQueue.main.async {
                self.socailApps = result
                self.collectionView.reloadData()
               
            }
           
        }
        
        fetchAppgroups()
    }
    func fetchAppgroups() {
        var editorsChoiceGames1:Feed?
        var editorsChoiceGames2:Feed?
    
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        Services.shared.fetchGames { result in
            dispatchGroup.leave()
            
                editorsChoiceGames1 = result
    
          }
      
        dispatchGroup.enter()
        Services.shared.fetchTopApps { result in
            dispatchGroup.leave()
           
                editorsChoiceGames2 = result
    
        }
        
        dispatchGroup.notify(queue: .main) {
            if let group = editorsChoiceGames1 {
                self.editorsChoiceGames.append(group)
            }
            
            if let group = editorsChoiceGames2 {
                self.editorsChoiceGames.append(group)
            }
            self.collectionView.reloadData()
            self.activityIndicatorView.stopAnimating()
        }
        
       
        
    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AppDetailControllerViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(vc, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return editorsChoiceGames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:  "AppPageHeader", for: indexPath) as! AppsPageHeader
        
        header.horinzontalControlller.headerData = socailApps
        header.horinzontalControlller.collectionView.reloadData()
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return (.init(width: view.frame.width, height: 400))
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as!  AppgroupCell
        cell.label.text = editorsChoiceGames[indexPath.row].title
        cell.horinzontalControlller.editorsChoiceGames =  editorsChoiceGames[indexPath.row]
        cell.horinzontalControlller.collectionView.reloadData()
        
        cell.horinzontalControlller.didSelectHandler = { [weak self] sresult in
            let redHorizontal = AppDetailControllerViewController()
            redHorizontal.navigationItem.title = sresult.name
            self?.navigationController?.pushViewController(redHorizontal, animated: true)
            
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (.init(width: view.frame.width, height: 400))
    }
}
