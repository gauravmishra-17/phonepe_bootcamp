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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        getItems()
        print(itemList)
        configureTableView()
        NSLayoutConstraint.activate(self.view.constraints)
        
    }
    
    func configureTableView()
    {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        tableView.rowHeight = 71
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
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as! ItemTableViewCell
        
        let item = itemList[indexPath.row]
        
        cell.set(item: item)
        
        return cell
    }
    
    
    
}

extension ItemsInTableViewController
{
    func getItems()   -> Void
    {
        ItemsService().getItems{ items in
            self.itemList = items
        }
        
    }
}
