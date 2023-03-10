//
//  ItemListDto.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

struct ItemListDto
{
    
    let items: [ItemDto]
}

extension ItemListDto : Decodable
{
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
