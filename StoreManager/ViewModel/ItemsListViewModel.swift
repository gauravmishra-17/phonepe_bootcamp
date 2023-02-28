//
//  ItemsInTableViewModel.swift
//  StoreManager
//
//  Created by gaurav.mishra on 26/02/23.
//

import UIKit

//protocols that view model will follow
protocol ViewModelDelegate: AnyObject {
    func updatedItemList(itemList : [ItemsViewModel])
   
}


//view model for list of item view models
class ItemsListViewModel  {

    var itemList : [ItemsViewModel] = []
    var delegate: ViewModelDelegate?
    
    init()
    {
//        getItems()
    }

    
    func getItems()   -> Void
    {
        ItemsService().getItems{ [self] items in
            self.itemList = items.itemList
            print(items.itemList.count)
            delegate?.updatedItemList(itemList: items.itemList)
        }
       
        
//        print(self.itemList.value.count)
    }
    
    

}
