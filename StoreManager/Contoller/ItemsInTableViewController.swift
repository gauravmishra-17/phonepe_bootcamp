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
//        configureTableView()
        
    }
    
    func configureTableView()
    {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.pin(to: view)
        
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
