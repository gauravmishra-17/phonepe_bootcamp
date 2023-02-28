//
//  ItemsInCollectionsView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInCollectionViewController: UIViewController

{
    //view model to hold view data
    var viewModel = ItemsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create view and load
        let view  = ItemsInCollectionView(viewModel: viewModel)
        self.view = view
       
    }
 

    
}

