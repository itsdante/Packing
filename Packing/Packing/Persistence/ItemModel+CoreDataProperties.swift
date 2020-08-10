//
//  ItemModel+CoreDataProperties.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemModel> {
        return NSFetchRequest<ItemModel>(entityName: "ItemModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var isCompleted: Bool
    @NSManaged public var isRestricted: Bool
    @NSManaged public var createdAt: Date?
    @NSManaged public var luggageModel: LuggageModel?

}
