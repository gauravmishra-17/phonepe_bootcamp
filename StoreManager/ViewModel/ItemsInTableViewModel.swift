//
//  ItemsInTableViewModel.swift
//  StoreManager
//
//  Created by gaurav.mishra on 26/02/23.
//

import UIKit

class ItemsInTableViewModel {
    
    var itemList : Box<[Item]> = Box([])
    
    init()
    {
        getItems()
    }

    
    func getItems()   -> Void
    {
        ItemsService().getItems{ items in
            self.itemList.value = items
        }
        
    }
    
    

}
