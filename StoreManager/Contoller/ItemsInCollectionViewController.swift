//
//  ItemsInCollectionsView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInCollectionViewController: UIViewController

{
    //table view initialised
    let collectionView  = ItemsInCollectionView(itemList:[] )
    private let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create and load view, and setup constraints
        self.view.addSubview(collectionView)
        
        //add refresh
        collectionView.collectionView.refreshControl = refreshControl
        //trigger on refresh
        refreshControl.addTarget(self, action:  #selector(handleRefreshControl), for: .valueChanged)
        //reload view
        self.collectionView.collectionView.reloadData()
        
        setUpConstraints()
    }
    
    //handle refresh
    @objc func handleRefreshControl() {
       
        ItemsListViewModel(itemList: []).updateItemListFromLocal()
        self.refreshControl.endRefreshing()
    }
    
    //update itemList to display
    func updatedItemList(itemList: [ItemsViewModel]) {
        self.collectionView.itemList = itemList
        DispatchQueue.main.async { [self] in
            self.collectionView.collectionView.reloadData()

        }

    }
    
    //update viewmodel to display
    func updateViewModel(viewModel: ItemsListViewModel )
    {
        self.collectionView.itemList = viewModel.itemList
        self.collectionView.collectionView.reloadData()
        
    }
    
    //setup constraints for table view
    func  setUpConstraints()
    {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        let leading = NSLayoutConstraint(item: collectionView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: collectionView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: collectionView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: collectionView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)

        self.view.addConstraint(leading)
        self.view.addConstraint(trailing)
        self.view.addConstraint(top)
        self.view.addConstraint(bottom)
    }

}

