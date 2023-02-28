//
//  ViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 15/02/23.
//

import UIKit
import Combine

//create root view controller as a Container View Controller - of type - UITabBarController
class HomePageViewController: UITabBarController, UISearchBarDelegate {
    
    var searchBar = SearchBarView()
    var viewModel = ItemsListViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set color on the root view and the bottom tabs
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        
        //add searchBar
        createSearchBar()
        
        //add navigationTabBar
        createNavigationTabBar()
        
        searchBar.searchBarView.delegate = self
        
        //activate constraints
        NSLayoutConstraint.activate(self.view.constraints)
        
    }
    
    
    
    
    private func createSearchBar() {
        view.addSubview(searchBar)
        searchBarConstraints()
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        var viewModel = ItemsListViewModel()

        viewModel.updateItemList(text: searchText)
    }
    private func createNavigationTabBar() {
        
        //setup viewControllers to point at the tabs
        var itemsInTableViewController = ItemsInTableViewController()
        var itemsInCollectionViewController = ItemsInCollectionViewController()
        
        self.setViewControllers([itemsInTableViewController,itemsInCollectionViewController,  ItemsInCollectionViewController(),ItemsInCollectionViewController(),ItemsInCollectionViewController() ], animated: true)
        
        
        //parse and get all items in the tab controller
        guard let tabs = self.tabBar.items else {
            return
        }
        
        
        //set image and color according to selection status of tab
        let configuration = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(hexString: "#5DB075"))
        var circle = UIImage(systemName: "circle.fill", withConfiguration: configuration)
        for i in 0..<tabs.count {
            tabs[i].image = UIImage(systemName: "circle" )
            tabs[i].selectedImage = circle
        }
    }
    
    
    func searchBarConstraints()
    {
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        let const1 = NSLayoutConstraint(item: searchBar , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: searchBar , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: searchBar , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let const4 = NSLayoutConstraint(item: searchBar , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)

        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)

    }
}

