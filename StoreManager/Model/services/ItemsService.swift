//
//  ItemsService.swift
//  StoreManager
//
//  Created by gaurav.mishra on 16/02/23.
//

import Foundation


class ItemsService
{
    //shared singleton session object
    private let session = URLSession.shared
    
    
    func getItems(completionHandler:@escaping (ItemsListViewModel) -> Void)
    {
        let url = URL(string: "https://run.mocky.io/v3/995ce2a0-1daf-4993-915f-8c198f3f752c")!
        let json = """
{
    "status": "success",
    "error": null,
    "data": {
        "items": [{
            "name": "Item 1",
            "price": "₹ 100",
                        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": "Same day shipping"
        }, {
            "name": "Item 2",
                    "price": "₹ 400",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": "Same day shipping"
        }, {
            "name": "Item 3",
            "price": "₹ 100",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": "Same day shipping"
        }, {
            "name": "Item 4",
            "price": "₹ 80",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }, {
            "name": "Item 5",
            "price": "₹ 190",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }, {
            "name": "Item 6",
            "price": "₹ 70",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }, {
            "name": "Item 7",
            "price": "₹ 190",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }, {
            "name": "Item 8",
            "price": "₹ 190",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }, {
            "name": "Item 9",
            "price": "₹ 190",
                    "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
            "extra": null
        }]
    }
}
"""
        let jsonData = json.data(using: .utf8)!
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            do{
                ///mock data
                let result = try  JSONDecoder().decode(ResultDto.self,from: jsonData )
                
                ///real data
                //                if(error != nil)
                //                {print("An error occurred while fecthing data from API")}
                //                else
                //                {
                //
                //                    let result = try  JSONDecoder().decode(ResultDto.self,from:data!)
                //                    print(result.data.items)
                //                    completionHandler(result.data.items)
                //
                //                }
                
                
                completionHandler(self.viewModelMapper(items: result.data.items))
                
            }
            catch
            {
                print(error)
            }
            
        })
        task.resume()
        
    }
    
    
}

extension ItemsService
{
    func viewModelMapper (items : [Item]) -> ItemsListViewModel
    {
        var viewModel = ItemsListViewModel()
        
        viewModel.itemList.value = items.compactMap(
            {
                ItemsViewModel(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })
        return viewModel
    }
}
