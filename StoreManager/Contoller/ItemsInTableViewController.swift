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
        
//        self.view = ItemsInTableView(viewModel:viewModel )
        //add views
//        view.addSubview(tableView)
        
        
        // Additional setup after loading the view.
//        configureTableView()
        
        //get items to list on screen
//        getItems()
        
        //activate constraints
//        NSLayoutConstraint.activate(self.view.constraints)
        var a  = ItemsInTableView(viewModel: viewModel)
        self.view = a
        viewModel.itemList.bind{
            [weak self] _ in
            DispatchQueue.main.async {
                a.tableView.reloadData()
            }
        }
        
    }
//    override func loadView() {
//
//
//    }
    
    func configureTableView()
    {
        //set delegates
        setTableViewDelegates()
        
        //set properties and constraints on the table
        tableView.rowHeight = 71
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: tableView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 34)
        let const2 = NSLayoutConstraint(item:tableView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -34)
        let const3 = NSLayoutConstraint(item: tableView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 177)
        let const4 = NSLayoutConstraint(item: tableView , attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        
        
        self.view.addConstraint(const1)
        self.view.addConstraint(const2)
        self.view.addConstraint(const3)
        self.view.addConstraint(const4)
        
        
        
    }
    
    
    func setTableViewDelegates()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getItems()   -> Void
    {
        ItemsService().getItems{ items in
            self.itemList = items
        }
        
    }
    
}


extension ItemsInTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as! ItemTableViewCell
        
        let item = itemList[indexPath.row]
        
        cell.set(item: item)
        
        return cell
    }
    
    
    
}


