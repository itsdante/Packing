//
//  TripModel+CoreDataClass.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TripModel)
public class TripModel: NSManagedObject {
    
    var rawDestinationCity: String {
        return destinationCity.replacingOccurrences(of: " ", with: "").lowercased()
    }

    public var luggageModelArray: [LuggageModel] {
        let set = luggageModel as? Set<LuggageModel> ?? []
        return set.sorted()
    }
    
    public var restrictionModelArray: [RestrictionModel] {
           let set = luggageModel as? Set<RestrictionModel> ?? []
        return set.sorted()
       }
}
