//
//  TripModel+CoreDataProperties.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData


extension TripModel: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripModel> {
        return NSFetchRequest<TripModel>(entityName: "TripModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var bookingNumber: String
    @NSManaged public var airline: String
    @NSManaged public var flightNumber: String
    @NSManaged public var originAirportCode: String
    @NSManaged public var originAirport: String
    @NSManaged public var originCity: String
    @NSManaged public var originCountry: String
    @NSManaged public var destinationAirportCode: String
    @NSManaged public var destinationAirport: String
    @NSManaged public var destinationCity: String
    @NSManaged public var destinationCountry: String
    @NSManaged public var departureDate: Date
    @NSManaged public var arrivalDate: Date
    @NSManaged public var createdAt: Date
    @NSManaged public var luggageModel: NSSet?
    @NSManaged public var restrictionModel: NSSet?

}

// MARK: Generated accessors for luggageModel
extension TripModel {

    @objc(addLuggageModelObject:)
    @NSManaged public func addToLuggageModel(_ value: LuggageModel)

    @objc(removeLuggageModelObject:)
    @NSManaged public func removeFromLuggageModel(_ value: LuggageModel)

    @objc(addLuggageModel:)
    @NSManaged public func addToLuggageModel(_ values: NSSet)

    @objc(removeLuggageModel:)
    @NSManaged public func removeFromLuggageModel(_ values: NSSet)

}

// MARK: Generated accessors for restrictionModel
extension TripModel {

    @objc(addRestrictionModelObject:)
    @NSManaged public func addToRestrictionModel(_ value: RestrictionModel)

    @objc(removeRestrictionModelObject:)
    @NSManaged public func removeFromRestrictionModel(_ value: RestrictionModel)

    @objc(addRestrictionModel:)
    @NSManaged public func addToRestrictionModel(_ values: NSSet)

    @objc(removeRestrictionModel:)
    @NSManaged public func removeFromRestrictionModel(_ values: NSSet)

}
