//
//  ItemsInCollectionsView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInCollectionViewController: UIViewController

{
    let collectionView  = ItemsInCollectionView(itemList:[] )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create view and load
        self.view.addSubview(collectionView)
        setUpConstraints()
    }
    func updatedItemList(itemList: [ItemsViewModel]) {
        self.collectionView.itemList = itemList
        DispatchQueue.main.async { [self] in
            self.collectionView.collectionView.reloadData()

        }

    }
    
    
    func updateViewModel(viewModel: ItemsListViewModel )
    {
        self.collectionView.itemList = viewModel.itemList
        self.collectionView.collectionView.reloadData()
        
    }
    
    func  setUpConstraints()
    {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        let const1 = NSLayoutConstraint(item: collectionView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: collectionView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: collectionView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let const4 = NSLayoutConstraint(item: collectionView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)

        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)
    }

}

