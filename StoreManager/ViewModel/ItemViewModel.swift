//
//  ItemViewModel.swift
//  StoreManager
//
//  Created by gaurav.mishra on 27/02/23.
//

import Foundation

class ItemsViewModel {
    
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
    }}
