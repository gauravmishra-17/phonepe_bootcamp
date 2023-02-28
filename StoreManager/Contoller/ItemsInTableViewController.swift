//
//  ItemsInTableView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInTableViewController: UIViewController {
    
    
    
    //view model to hold view data
    var viewModel = ItemsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create view and load
        let view  = ItemsInTableView(viewModel: viewModel)
        self.view = view
        
        //bind item list and reload whenever data change occurs
//        viewModel.itemList.bind{
//            [weak self] _ in
//            DispatchQueue.main.async {
//                view.tableView.reloadData()
//            }
//        }
        
    }
    
}


