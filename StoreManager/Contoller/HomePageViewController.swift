//
//  ViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 15/02/23.
//

import UIKit
import Combine

//create root view controller as a Container View Controller - of type - UITabBarController
class HomePageViewController: UITabBarController, SearchBarDelegate, ViewModelDelegate {
    
    
    //tab controllers initialised
    var itemsInTableViewController = ItemsInTableViewController()
    var itemsInCollectionViewController = ItemsInCollectionViewController()
    private let refreshControl = UIRefreshControl()
    
    //views and viewmodels initialised
    var searchBar = SearchBarView()
    var viewModel = ItemsListViewModel(itemList: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set color on the root view and the bottom tabs
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        
        //add searchBar
        createSearchBar()
        
        //add navigationTabBar
        createNavigationTabBar()
        
        //setup delegates
        searchBar.delegate = self
        viewModel.delegate = self
        
        //load viewmodel with data
        viewModel.getItems()
        
        
        
        //activate constraints
        NSLayoutConstraint.activate(self.view.constraints)
        
    }
    
    //update viewmodel based on searched text
    func updatedViewModel(viewModel: ItemsListViewModel) {
        itemsInTableViewController.updateViewModel(viewModel:viewModel)
        itemsInCollectionViewController.updateViewModel(viewModel:viewModel)
    }
    
    //update list of items to be shown in the tabs when data is fecthed
    func updatedItemList(itemList: [ItemsViewModel]) {
        itemsInTableViewController.updatedItemList(itemList: itemList)
        itemsInCollectionViewController.updatedItemList(itemList: itemList)
    }
    
    
    //create searchBar view
    private func createSearchBar() {
        view.addSubview(searchBar)
        searchBarConstraints()
        
    }
    
    //create navigationtab bar
    private func createNavigationTabBar() {
        
        //setup viewControllers to point at the tabs
        self.setViewControllers([itemsInTableViewController,itemsInCollectionViewController,
                                 ItemsInCollectionViewController(),ItemsInCollectionViewController(),ItemsInCollectionViewController() ], animated: true)
        
        
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
    
    
    //setup contraints for search bar
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

