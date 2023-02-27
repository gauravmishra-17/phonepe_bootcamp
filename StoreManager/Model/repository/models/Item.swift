//
//  Item.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

//Model to store an Item's detalis
class Item
{
    //Properties to define and Item with name, price and extra data
    var name: String? = ""
    var price: String? = ""
    var extra: String? = ""
    var image: String? = ""
    
    init(name: String?, price: String?, extra: String?, image: String?)
    {
        self.name = name
        self.price = price
        self.extra = extra
        self.image = image
    }
}
