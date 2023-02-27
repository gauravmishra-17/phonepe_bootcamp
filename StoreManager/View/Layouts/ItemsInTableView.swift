//
//  ItemsInTableView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 26/02/23.
//

import UIKit

class ItemsInTableView: UIView {
    
    var itemList:[Item] = []
    var count = 0
    
    var viewModel : ItemsListViewModel
    var tableView = UITableView()
    
    init(viewModel: ItemsListViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        self.setup()
        self.style()
        self.setupConstraints()
        
        //activate constraints
        NSLayoutConstraint.activate(self.constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup()
    {
        //add subview
        addSubview(tableView)
        
        //set delegates
        setTableViewDelegates()
        
    }
    func setTableViewDelegates()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
    func style()
    {
        //set properties on the table
        tableView.rowHeight = 71
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        
        
        
    }
    
    //constranits in the view
    func setupConstraints()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: tableView , attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 34)
        let const2 = NSLayoutConstraint(item:tableView , attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -34)
        let const3 = NSLayoutConstraint(item: tableView , attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 177)
        let const4 = NSLayoutConstraint(item: tableView , attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        
        self.addConstraint(const1)
        self.addConstraint(const2)
        self.addConstraint(const3)
        self.addConstraint(const4)
    }
    
}



