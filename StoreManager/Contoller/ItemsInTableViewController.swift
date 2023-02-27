//
//  ItemsInTableView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInTableViewController: UIViewController {
    
    var tableView = UITableView()
    var itemList:[Item] = []
    {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var viewModel = ItemsInTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let view  = ItemsInTableView(viewModel: viewModel)
        self.view = view
        viewModel.itemList.bind{
            [weak self] _ in
            DispatchQueue.main.async {
                view.tableView.reloadData()
            }
        }
        
    }
    
}


