//
//  SearchBarViewController.swift
//  StoreManager
//
//  Created by gaurav.mishra on 28/02/23.
//

import UIKit

class SearchBarViewController: UIViewController, UISearchBarDelegate {
    

    var titleUI :UIView = UIView()
    var filterUI :UIView = UIView()
    var viewModel = ItemsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //create app bar view
        createAppBarView()
    }
    
    
    func createAppBarView(){
        
        //set background color and size of appbar
        createBackground()
        
        //create Title text
        createTitle()
        
        //create Filter text
        createFilter()
        
        //create Search bar UI
        createSearchBar()
        
        //activate constraints
        NSLayoutConstraint.activate(self.view.constraints)
        
    }
    
    func createBackground()
    {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hexString: "#E6E9F6")
        self.view.addSubview(backgroundView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: backgroundView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        
        let constraint2 = NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        
        
        let constraint3 = NSLayoutConstraint(item: backgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)
        
        let constraint4 = NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        
        
        self.view.addConstraint(constraint1)
        self.view.addConstraint(constraint2)
        self.view.addConstraint(constraint3)
        self.view.addConstraint(constraint4)
        
    }
    
    func  createTitle()
    {
        let titleView = UILabel()
        titleView.text = "Explore"
        titleView.font = .systemFont(ofSize: 18,weight: .bold)
        self.view.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: titleView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 49)
        
        let constraint2 = NSLayoutConstraint(item: titleView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 35)
        
        self.view.addConstraint(constraint1)
        self.view.addConstraint(constraint2)
        
        titleUI = titleView
    }
    
    func createFilter()
    {
        let filterView = UILabel()
        filterView.text = "Filter"
        filterView.font = .systemFont(ofSize: 16)
        filterView.textColor = UIColor(hexString: "#5DB075")
        self.view.addSubview(filterView)
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: filterView, attribute: .leading, relatedBy: .equal, toItem: self.titleUI, attribute: .trailing, multiplier: 1, constant: 223)
        
        let constraint2 = NSLayoutConstraint(item: filterView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 37)
        
        self.view.addConstraint(constraint1)
        self.view.addConstraint(constraint2)
    }
    
    func  createSearchBar()
    {
        let searchBarView = UISearchBar()
        
        searchBarView.backgroundColor = .white
        searchBarView.searchTextField.backgroundColor = .clear
        searchBarView.layer.cornerRadius = 20
        searchBarView.placeholder = "Search"
        searchBarView.clipsToBounds = true
        self.view.addSubview(searchBarView)
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: searchBarView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 34)
        
        let constraint2 = NSLayoutConstraint(item: searchBarView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 72)
        
        let constraint3 = NSLayoutConstraint(item: searchBarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let constraint4 = NSLayoutConstraint(item: searchBarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 343)
        
        self.view.addConstraint(constraint1)
        self.view.addConstraint(constraint2)
        self.view.addConstraint(constraint3)
        self.view.addConstraint(constraint4)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        viewModel.updateItemList(text: searchText)
    }
    

}
