//
//  RestrictionModel+CoreDataClass.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData

@objc(RestrictionModel)
public class RestrictionModel: NSManagedObject {

    public var restrictionDetailModelArray: [RestrictionDetailModel] {
        let set = restrictionDetailModel as? Set<RestrictionDetailModel> ?? []
        return set.sorted()
    }
}

extension RestrictionModel: Comparable {
    public static func < (lhs: RestrictionModel, rhs: RestrictionModel) -> Bool {
        lhs.mainTitle < rhs.mainTitle
    }
}
