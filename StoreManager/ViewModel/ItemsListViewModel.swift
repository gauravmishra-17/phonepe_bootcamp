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
        ItemsService().getItems{ items in
            self.itemList.value = items.itemList.value
        }
        
    }
    
    

}
