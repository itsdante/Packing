//
//  LuggageModel+CoreDataProperties.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData


extension LuggageModel: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LuggageModel> {
        return NSFetchRequest<LuggageModel>(entityName: "LuggageModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var category: String
    @NSManaged public var isCheckedIn: Bool
    @NSManaged public var order: Int32
    @NSManaged public var gender: String
    @NSManaged public var itemModel: NSSet?
    @NSManaged public var tripModel: TripModel

}

// MARK: Generated accessors for itemModel
extension LuggageModel {

    @objc(addItemModelObject:)
    @NSManaged public func addToItemModel(_ value: ItemModel)

    @objc(removeItemModelObject:)
    @NSManaged public func removeFromItemModel(_ value: ItemModel)

    @objc(addItemModel:)
    @NSManaged public func addToItemModel(_ values: NSSet)

    @objc(removeItemModel:)
    @NSManaged public func removeFromItemModel(_ values: NSSet)

}
