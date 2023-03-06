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
    
    enum MenuState{
        case opened
        case closed
    }
    
    //tab controllers initialised
    var itemsInTableViewController = ItemsInTableViewController()
    var itemsInCollectionViewController = ItemsInCollectionViewController()
    private let refreshControl = UIRefreshControl()
    
    //views and viewmodels initialised
    var searchBar = SearchBarView()
    var viewModel = ItemsListViewModel(itemList: [])
    var drawerMenu = UIView()
    var tapGesture = UITapGestureRecognizer()
    var widthMenu = NSLayoutConstraint()
    
    //set default menu drawer value
    private var menuState: MenuState = .closed
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set color on the root view and the bottom tabs
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        
        //add searchBar
        createSearchBar()
        
        //add navigationTabBar
        createNavigationTabBar()
        
        //add drawer menu
        createDrawerMenu()
        
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
        let circle = UIImage(systemName: "circle.fill", withConfiguration: configuration)
        for i in 0..<tabs.count {
            tabs[i].image = UIImage(systemName: "circle" )
            tabs[i].selectedImage = circle
        }
    }
    
    
    //setup contraints for search bar
    func searchBarConstraints()
    {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: searchBar , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: searchBar , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: searchBar , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: searchBar , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)
        
        self.view.addConstraint(leading)
        self.view.addConstraint(trailing)
        self.view.addConstraint(top)
        self.view.addConstraint(height)
        
    }
    
    func createDrawerMenu()
    {
        drawerMenu.translatesAutoresizingMaskIntoConstraints = false
        drawerMenu.backgroundColor = .white
        
        view.addSubview(drawerMenu)
        
        let leading = NSLayoutConstraint(item: drawerMenu , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: drawerMenu , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: drawerMenu , attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: self.drawerMenu , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        widthMenu = width
        self.view.addConstraint(leading)
        self.view.addConstraint(top)
        self.view.addConstraint(bottom)
        self.view.addConstraint(widthMenu)
        
    }
    
    func drawerMenuOnTapped() {
        switch menuState {
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.widthMenu.constant = 0
                self.menuState = .closed
                self.view.gestureRecognizers?.forEach(self.view.removeGestureRecognizer)
            }, completion: {
                done in
                if done {
                    
                }
            })
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.widthMenu.constant = self.view.frame.width/2
                self.view.addGestureRecognizer(self.tapGesture)
                self.tapGesture.addTarget(self, action: #selector(self.onTapped))
                self.menuState = .opened
            }, completion: {
                done in
                if done {
                    
                }
            })
            break
        }
    }
    
    @objc
    func onTapped(){
        drawerMenuOnTapped()
    }
    
}

