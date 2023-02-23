//
//  ItemsInTableView.swift
//  StoreManager
//
//  Created by gaurav.mishra on 20/02/23.
//

import UIKit

class ItemsInTableViewController: UIViewController {
    
    var tableView = UITableView()
    var itemList:[Item]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task
        {
            itemList = await getItems()
            
        }
        
        // Do any additional setup after loading the view.
        configureTableView()
        NSLayoutConstraint.activate(self.view.constraints)

    }
    
    func configureTableView()
    {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        tableView.rowHeight = 100
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let const1 = NSLayoutConstraint(item: tableView , attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let const2 = NSLayoutConstraint(item:tableView , attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let const3 = NSLayoutConstraint(item: tableView , attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension ItemsInTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ItemTableViewCell()
    }
    
    
    
}

extension ItemsInTableViewController
{
    func getItems() async -> [Item]?
    {
        return await ItemsService().getItems()?.items
        
    }
}
