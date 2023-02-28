//
//  ItemsInTableViewModel.swift
//  StoreManager
//
//  Created by gaurav.mishra on 26/02/23.
//

import UIKit

//view model for list of item view models
class ItemsListViewModel {
    
    var itemList : Box<[ItemsViewModel]> = Box([])
    
    init()
    {
        getItems()
    }
    
    
    func getItems()   -> Void
    {
        print("get Items")
        ItemsService().getItems{ items in
            self.itemList.value = items.itemList.value
        }
        
    }
    func updateItemList(text : String)
    {
        let filteredItems: Box<[ItemsViewModel]> = Box([])
        print(itemList)
        print(itemList.value.count)
        print(text)
        itemList.value.forEach({storeItem in
            
            print(storeItem.name)
            if storeItem.name?.contains(text) ?? false
            {
                print(storeItem.name)
                print(text)
                filteredItems.value.append(storeItem)
            }
            else if storeItem.extra?.contains(text) ?? false
            {
                print(storeItem.extra)
                print(text)
                filteredItems.value.append(storeItem)
            }
            else if storeItem.price?.contains(text) ?? false
            {print(storeItem.price)
                print(text)
                filteredItems.value.append(storeItem)
            }
        })
        self.itemList.value = filteredItems.value
    }
    
}
