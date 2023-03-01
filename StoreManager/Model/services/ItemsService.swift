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
//                let result = try  JSONDecoder().decode(ResultDto.self,from: jsonData )
//                var dataModel = self.dataModelMapper(items: result.data.items)
//                completionHandler(self.viewModelMapper(items: dataModel.items))
                
                ///real data
                                if(error != nil)
                                {print("An error occurred while fecthing data from API")
                                    CoreDataHelper(managedObjectContext: CoreDataStack.shared.mainContext).fetchItemsFromCoreData(saveItems: {storeItems in
                                        var dataModel = self.coreDataMapper(items: storeItems)
                                        completionHandler(self.viewModelMapper(items: dataModel.items))
                                    })
                                }
                                else
                                {
                
                                    let result = try  JSONDecoder().decode(ResultDto.self,from:data!)
                                    var dataModel = self.dataModelMapper(items: result.data.items)
                                    completionHandler(self.viewModelMapper(items: dataModel.items))
                
                                }
                
                
                
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
        var viewModel = ItemsListViewModel(itemList: [])
        
        viewModel.itemList = items.compactMap(
            {
                ItemsViewModel(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })
        
        return viewModel
    }
    
    func dataModelMapper (items : [ItemDto]) -> ItemList
    {
        var dataModel = ItemList(items:[])
        
        dataModel.items = items.compactMap(
            {
                Item(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })
        //delete old data stored
        CoreDataHelper(managedObjectContext: CoreDataStack.shared.mainContext).deleteAll()
        
        //update with new data fetched from the api
        CoreDataHelper(managedObjectContext: CoreDataStack.shared.mainContext).saveStoreItems(items: dataModel.items)
        return dataModel
    }
    
    func coreDataMapper (items : [ItemData]) -> ItemList
    {
        var dataModel = ItemList(items:[])
        
        dataModel.items = items.compactMap(
            {
                Item(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })

        return dataModel
    }
}
