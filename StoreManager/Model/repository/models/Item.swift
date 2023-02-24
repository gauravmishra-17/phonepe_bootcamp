//
//  Item.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

//Model to store an Item's detalis
struct Item : Decodable
{
    //Properties to define and Item with name, price and extra data
    let name: String?
    let price: String?
    let extra: String?
    let image: String?
}
