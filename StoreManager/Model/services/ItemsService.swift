//
//  ItemsService.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation


struct ItemsService
{
    //shared singleton session object
    private let session = URLSession.shared
    
    
    func getItems() async -> ItemListDto?
    {
        do {
            let url = URL(string: "https://run.mocky.io/v3/b6a30bb0-140f-4966-8608-1dc35fa1fadc")!
            let (returnData, _) = try await session.data(from: url)
            let result = try  JSONDecoder().decode(ResultDto.self,from:returnData)
            return result.data
        }catch {
            print(error)
            return nil
        }
        
    }
    
}
