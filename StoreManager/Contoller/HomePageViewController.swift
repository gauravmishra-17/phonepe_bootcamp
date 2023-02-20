//
//  ViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 15/02/23.
//

import UIKit
import Combine

class HomePageViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        view.addSubview(AppBarViewController().view)
       
        createBottomBar()
    }
    
    
  
    private func createBottomBar() {
        
        // controller for tableView
        let tableViewController = UINavigationController(rootViewController: ItemsInTableView())
        
        // controller for collectionView
        let collectionViewController = UINavigationController(rootViewController: ItemsInCollectionView())
        
        self.setViewControllers([tableViewController, collectionViewController], animated: true)
        
        guard let tabs = self.tabBar.items else {
            return
        }

        let tabBarImageItem = ["tablecells","square.grid.2x2"]
        let tabBarSelectedImageItem = ["tablecells.fill", "square.grid.2x2.fill"]

        for i in 0..<tabs.count {
            tabs[i].image = UIImage(systemName: tabBarImageItem[i])
            tabs[i].selectedImage = UIImage(systemName: tabBarSelectedImageItem[i])
        }
    }
}

