//
//  AppBarView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 22/02/23.
//

import UIKit

protocol SearchBarDelegate {
    func updatedViewModel(viewModel: ItemsListViewModel)
}

class SearchBarView: UIView, UISearchBarDelegate {
    
    
    //declare all views to be added as part of search bar
    var titleUI :UIView = UIView()
    var filterUI :UIView = UIView()
    let searchBarView = UISearchBar()
    var viewModel = ItemsListViewModel(itemList: [])
    var delegate: SearchBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setup delegates for search bar
        searchBarView.delegate = self
        
        //create app bar view
        createSearchBarView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func createSearchBarView(){
        
        //set background color and size of appbar
        createBackground()
        
        //create Title text
        createTitle()
        
        //create Filter text
        createFilter()
        
        //create Search bar UI
        createSearchBar()
        
        //activate constraints
        NSLayoutConstraint.activate(self.constraints)
        
    }
    
    
    
    //set background color and size of appbar
    func createBackground()
    {
        //add subview
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hexString: "#E6E9F6")
        self.addSubview(backgroundView)
        
        
        
        //setup constarints
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: backgroundView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        
        let constraint2 = NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        
        
        let constraint3 = NSLayoutConstraint(item: backgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 143)
        
        let constraint4 = NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        
        
        self.addConstraint(constraint1)
        self.addConstraint(constraint2)
        self.addConstraint(constraint3)
        self.addConstraint(constraint4)
        
    }
    
    
    //create Title text
    func  createTitle()
    {
        //add subview
        let titleView = UILabel()
        titleView.text = "Explore"
        titleView.font = .systemFont(ofSize: 18,weight: .bold)
        self.addSubview(titleView)
        
        //setup constarints
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: titleView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 49)
        
        let constraint2 = NSLayoutConstraint(item: titleView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 35)
        
        self.addConstraint(constraint1)
        self.addConstraint(constraint2)
        
        titleUI = titleView
    }
    
    //create Filter text
    func createFilter()
    {
        //add subview
        let filterView = UILabel()
        filterView.text = "Filter"
        filterView.font = .systemFont(ofSize: 16)
        filterView.textColor = UIColor(hexString: "#5DB075")
        self.addSubview(filterView)
        
        //setup constarints

        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: filterView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 338)
        
        let constraint2 = NSLayoutConstraint(item: filterView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 37)
        
        self.addConstraint(constraint1)
        self.addConstraint(constraint2)
    }
    
    //create Search bar UI
    func  createSearchBar()
    {
        //add subview
        searchBarView.backgroundColor = .white
        searchBarView.searchTextField.backgroundColor = .clear
        searchBarView.layer.cornerRadius = 20
        searchBarView.placeholder = "Search"
        searchBarView.clipsToBounds = true
        self.addSubview(searchBarView)
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint1 = NSLayoutConstraint(item: searchBarView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 34)
        
        let constraint2 = NSLayoutConstraint(item: searchBarView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 72)
        
        let constraint4 = NSLayoutConstraint(item: searchBarView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -34)
        let constraint3 = NSLayoutConstraint(item: searchBarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
       
        
        self.addConstraint(constraint1)
        self.addConstraint(constraint2)
        self.addConstraint(constraint3)
        self.addConstraint(constraint4)
    }
    
    
    //update the displayed list of items based on searched text
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let newViewModel = viewModel.updateItemList(text: searchText)
        delegate?.updatedViewModel(viewModel: newViewModel )

    }

    
}





