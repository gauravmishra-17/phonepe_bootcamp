//
//  ViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 15/02/23.
//

import UIKit
import Combine

//create root view controller as a Container View Controller - of type - UITabBarController
class HomePageViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set color on the root view and the bottom tabs
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        view.insetsLayoutMarginsFromSafeArea = false
        
        //add appBar
        let appbar = AppBarView()
        view.addSubview(appbar)
        appbar.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: appbar , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: appbar , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: appbar , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let const4 = NSLayoutConstraint(item: appbar , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)
        
        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)
        
        NSLayoutConstraint.activate(self.view.constraints)
        
        
        //add bottomBar
        createBottomBar()
    }
    
  
    private func createBottomBar() {
        
        self.setViewControllers([ItemsInTableViewController(), ItemsInCollectionViewController()], animated: true)
        
        //parse and get all items in the tab controller
        guard let tabs = self.tabBar.items else {
            return
        }

        let tabBarImageItem = ["tablecells","square.grid.2x2"]
        let tabBarSelectedImageItem = ["tablecells.fill", "square.grid.2x2.fill"]

        //set image and colo according to selection status of tab
        for i in 0..<tabs.count {
            tabs[i].image = UIImage(systemName: tabBarImageItem[i])
            tabs[i].selectedImage = UIImage(systemName: tabBarSelectedImageItem[i])
        }
    }
}

