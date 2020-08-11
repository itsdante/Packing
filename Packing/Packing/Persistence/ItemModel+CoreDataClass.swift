//
//  ItemModel+CoreDataClass.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ItemModel)
public class ItemModel: NSManagedObject {

}

extension ItemModel: Comparable {
    public static func < (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.createdAt < rhs.createdAt
    }
}
