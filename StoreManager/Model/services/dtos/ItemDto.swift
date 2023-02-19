//
//  ItemDto.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

//Model to recive an Item's detalis
struct ItemDto : Decodable
{
    //Properties to define and Item with name, price and extra data
    let name: String
    let price: String
    let extra: String
}
