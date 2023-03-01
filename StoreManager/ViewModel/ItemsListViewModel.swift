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
    
    init(itemList : [ItemsViewModel] )
    {
        self.itemList = itemList
    }
    
    func getItems()   -> Void
    {
        
        ItemsService().getItems{ [self] items in
            self.itemList = items.itemList
            delegate?.updatedItemList(itemList: self.itemList)
        }

        
    }
    func updateItemList(text : String) -> ItemsListViewModel
    {
        getItems()
        var filteredItems: [ItemsViewModel] = []
        self.itemList.forEach({storeItem in
            
            if storeItem.name?.contains(text) ?? false
            {
                filteredItems.append(storeItem)
            }
            else if storeItem.extra?.contains(text) ?? false
            {
                filteredItems.append(storeItem)
            }
            else if storeItem.price?.contains(text) ?? false
            {
                filteredItems.append(storeItem)
            }
        })
        
        if text == ""
        {filteredItems = self.itemList}
        
        return ItemsListViewModel(itemList: filteredItems)
        
    }
    
    func updateItemListFromLocal() -> Void
    {
        
        ItemsService().getItemsFromLocal{ [self] items in
            self.itemList = items.itemList
            delegate?.updatedItemList(itemList: self.itemList)
        }
        
    }
    
}
