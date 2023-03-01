//
//  CoreDataHelper.swift
//  StoreManager
//
//  Created by gaurav.mishra on 01/03/23.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper{
    private let managedObjectContext: NSManagedObjectContext
    init(managedObjectContext: NSManagedObjectContext){
        self.managedObjectContext = managedObjectContext
    }
    /*Fetches Item from Core data and if local data is empty
     value is fetched from API.
     And the value is stored in the local storage
     */
    func fetchItemsFromCoreData(saveItems: @escaping ([ItemData]) -> ()){
        var storeItems: [ItemData]?
        do{
            storeItems  = try managedObjectContext.fetch(ItemData.fetchRequest())
        }
        catch{
            print(error)
        }
        saveItems(storeItems!)
        
    }
    
    //This method stores values in local storage.
    func saveStoreItems(items: [Item])-> [ItemData]{
        var storeItems: [ItemData] = []
        items.forEach({item in
            let storeItem = ItemData(context: managedObjectContext)
            storeItem.price = item.price
            storeItem.name = item.name
            storeItem.image = item.image
            storeItem.extra = item.extra ?? ""
            storeItems.append(storeItem)
            if managedObjectContext.hasChanges {
                managedObjectContext.performAndWait({
                    do {
                        try managedObjectContext.save()
                    }
                    catch{
                        print(error)
                    }
                })
            }
        })
        
        return storeItems
    }
    
    func deleteAll(){
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do {
                try managedObjectContext.execute(deleteRequest)
                try managedObjectContext.save()
            }
            catch {
                print ("There was an error")
            }
    }
}
