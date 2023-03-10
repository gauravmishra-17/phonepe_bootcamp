//
//  Result.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

struct ResultDto
{
    let status: String
    let error: String?
    let data: ItemListDto
    
}

extension ResultDto : Decodable
{
    enum CodingKeys : String, CodingKey
    {
        case status = "status"
        case error = "error"
        case data = "data"
    }
}
