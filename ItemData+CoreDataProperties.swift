//
//  ItemData+CoreDataProperties.swift
//  StoreManager
//
//  Created by gaurav.mishra on 01/03/23.
//
//

import Foundation
import CoreData


extension ItemData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemData> {
        return NSFetchRequest<ItemData>(entityName: "ItemData")
    }

    @NSManaged public var extra: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?

}

extension ItemData : Identifiable {

}
