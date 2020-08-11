//
//  RestrictionDetailModel+CoreDataClass.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData

@objc(RestrictionDetailModel)
public class RestrictionDetailModel: NSManagedObject {

}

extension RestrictionDetailModel: Comparable {
    public static func < (lhs: RestrictionDetailModel, rhs: RestrictionDetailModel) -> Bool {
        lhs.subTitle < rhs.subTitle
    }
}
