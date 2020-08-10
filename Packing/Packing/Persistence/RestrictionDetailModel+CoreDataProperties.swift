//
//  RestrictionDetailModel+CoreDataProperties.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData


extension RestrictionDetailModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestrictionDetailModel> {
        return NSFetchRequest<RestrictionDetailModel>(entityName: "RestrictionDetailModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var subTitle: String?
    @NSManaged public var subDetail: String?
    @NSManaged public var image: String?
    @NSManaged public var restrictionModel: RestrictionModel?

}
