//
//  ItemDto.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

//Model to recive an Item's detalis
struct ItemDto {
    let name: String?
    let price: String?
    let extra: String?
    let image: String?
}

extension ItemDto: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case extra = "extra"
        case image = "image"
    }
}
