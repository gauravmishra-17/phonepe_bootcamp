//
//  ItemsInTableView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInTableViewController: UIViewController {

    //table view initialised
    let tableView  = ItemsInTableView(itemList:[] )
    private let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create and load view, and setup constraints
        self.view.addSubview(tableView)
        
        //add refresh
        tableView.tableView.refreshControl = refreshControl
        //trigger on refresh
        refreshControl.addTarget(self, action:  #selector(handleRefreshControl), for: .valueChanged)
        //reload view
        self.tableView.tableView.reloadData()
        
        setUpConstraints()
    }
    
    //handle refresh
    @objc func handleRefreshControl() {
       
        ItemsListViewModel(itemList: []).updateItemListFromLocal()
        self.refreshControl.endRefreshing()
    }
    
    //update itemList to display
    func updatedItemList(itemList: [ItemsViewModel]) {
        self.tableView.itemList = itemList
        DispatchQueue.main.async { [self] in
            self.tableView.tableView.reloadData()

        }

    }
    
    //update viewmodel to display
    func updateViewModel(viewModel: ItemsListViewModel )
    {
        self.tableView.itemList = viewModel.itemList
        self.tableView.tableView.reloadData()
        
    }
    
    //setup constraints for table view
    func  setUpConstraints()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        let const1 = NSLayoutConstraint(item: tableView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item: tableView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: tableView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let const4 = NSLayoutConstraint(item: tableView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)

        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)
    }
    
}


