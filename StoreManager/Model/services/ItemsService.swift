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
    
    //api endpoint
    let url = URL(string: "https://run.mocky.io/v3/995ce2a0-1daf-4993-915f-8c198f3f752c")!

    
    //service to get data through network call or local call depending on api status code
    func getItems(completionHandler:@escaping (ItemsListViewModel) -> Void)
    {
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            do{
                if(error != nil)
                {print("An error occurred while fecthing data from API")
                    CoreDataHelper(managedObjectContext: CoreDataStack.shared.mainContext).fetchItemsFromCoreData(saveItems: {storeItems in
                        var dataModel = self.coreDataMapper(items: storeItems)
                        if dataModel.items != nil
                        {completionHandler(self.viewModelMapper(items: dataModel.items))
                        }
                    })
                }
                else
                {
                    //api call to receive data
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
    
    
    func getItemsFromLocal(completionHandler:@escaping (ItemsListViewModel) -> Void)
    {
        CoreDataHelper(managedObjectContext:CoreDataStack.shared.mainContext).fetchItemsFromCoreData(saveItems: {storeItems in
            var dataModel = self.coreDataMapper(items: storeItems)
            if dataModel.items != nil
            {completionHandler(self.viewModelMapper(items: dataModel.items))
            }
        })
    }
    
    
}

extension ItemsService
{
    
    //mapper for data model to view model
    func viewModelMapper (items : [Item]) -> ItemsListViewModel
    {
        var viewModel = ItemsListViewModel(itemList: [])
        
//        mapping
        viewModel.itemList = items.compactMap(
            {
                ItemsViewModel(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })
        
        return viewModel
    }
    
    //mapper for dto to view model
    func dataModelMapper (items : [ItemDto]) -> ItemList
    {
        var dataModel = ItemList(items:[])
        
        //mapping
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
    
    //mapper for local data to data model
    func coreDataMapper (items : [ItemData]) -> ItemList
    {
        var dataModel = ItemList(items:[])
        
        //mapping
        dataModel.items = items.compactMap(
            {
                Item(name: $0.name, price: $0.price, extra: $0.extra, image: $0.image)
            })
        
        return dataModel
    }
}
