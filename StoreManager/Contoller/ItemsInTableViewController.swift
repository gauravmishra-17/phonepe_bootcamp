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
    var sliderView = SliderView(maximumValue: 9, minimumValue: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create and load view
        self.view.addSubview(tableView)
        self.view.addSubview(sliderView)

        
        //add refresh
        tableView.tableView.refreshControl = refreshControl
        //trigger on refresh
        refreshControl.addTarget(self, action:  #selector(handleRefreshControl), for: .valueChanged)
        //reload view
        self.tableView.tableView.reloadData()
        
        //setUpConstraints
        setUpConstraints()
        setUpConstraintsForSlider()
        
        NSLayoutConstraint.activate(self.view.constraints)
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

        let leading = NSLayoutConstraint(item: tableView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: tableView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: tableView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: tableView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)

        self.view.addConstraint(leading)
        self.view.addConstraint(trailing)
        self.view.addConstraint(top)
        self.view.addConstraint(height)
    }
    
    func setUpConstraintsForSlider(){
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: sliderView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0 )
        let trailing = NSLayoutConstraint(item: sliderView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: sliderView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant:595 )
        let width = NSLayoutConstraint(item: sliderView , attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.width )
        let height = NSLayoutConstraint(item: sliderView , attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200 )

        
        self.view.addConstraint(leading)
        self.view.addConstraint(top)
        self.view.addConstraint(width)
        self.view.addConstraint(trailing)
        self.view.addConstraint(height)


    }
    
}


