//
//  ViewController.swift
//  AppleStoreProject
//
//  Created by MacBook AIR on 06/10/2023.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        
        let todayVC = UINavigationController(rootViewController: TodayViewController(collectionViewLayout:UICollectionViewFlowLayout()))
        todayVC.navigationItem.title = "Search"
        todayVC.tabBarItem.title = "Apps"
        
        todayVC.tabBarItem.image = UIImage(systemName: "rectangle.stack")
        todayVC.navigationController?.navigationBar.prefersLargeTitles = true
        
      
        
        let appVC = UINavigationController(rootViewController:   AppsViewController(collectionViewLayout:UICollectionViewFlowLayout()))
        todayVC.navigationItem.title = "Search"
        appVC.navigationItem.title = "Search"
        appVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        appVC.tabBarItem.title = "Apps"
        
        let searchVC = SearchViewController()
        searchVC.navigationItem.title = "Search"
        searchVC.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        searchVC.tabBarItem.title = "Apps"
        
        viewControllers = [todayVC,appVC,searchVC]
        
        
        view.backgroundColor = .white
        
        
    }
    
    
}

