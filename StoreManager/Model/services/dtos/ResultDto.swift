//
//  Result.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation

class ResultDto : Decodable
{
    let status: String
    let error: String?
    let data: ItemListDto
    
}
