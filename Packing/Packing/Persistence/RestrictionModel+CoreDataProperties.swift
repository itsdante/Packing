//
//  RestrictionModel+CoreDataProperties.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData


extension RestrictionModel: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestrictionModel> {
        return NSFetchRequest<RestrictionModel>(entityName: "RestrictionModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var mainTitle: String
    @NSManaged public var mainDetail: String
    @NSManaged public var restrictionDetailModel: NSSet?
    @NSManaged public var tripModel: TripModel

}

// MARK: Generated accessors for restrictionDetailModel
extension RestrictionModel {

    @objc(addRestrictionDetailModelObject:)
    @NSManaged public func addToRestrictionDetailModel(_ value: RestrictionDetailModel)

    @objc(removeRestrictionDetailModelObject:)
    @NSManaged public func removeFromRestrictionDetailModel(_ value: RestrictionDetailModel)

    @objc(addRestrictionDetailModel:)
    @NSManaged public func addToRestrictionDetailModel(_ values: NSSet)

    @objc(removeRestrictionDetailModel:)
    @NSManaged public func removeFromRestrictionDetailModel(_ values: NSSet)

}
