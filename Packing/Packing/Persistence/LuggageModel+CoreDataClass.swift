//
//  LuggageModel+CoreDataClass.swift
//  Packing
//
//  Created by Andimas Bagaswara on 10/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//
//

import UIKit
import CoreData

@objc(LuggageModel)
public class LuggageModel: NSManagedObject {

    public var itemModelArray: [ItemModel] {
        let set = itemModel as? Set<ItemModel> ?? []
        return set.sorted { (item1, item2) -> Bool in
            return !item1.isCompleted
        }
    }
    
    var categoryColor: UIColor {
        switch category {
        case "Essentials":
            return UIColor.init(hex: 0xFFC738)
        case "Toiletries":
            return UIColor.init(hex: 0xFF90AB)
        case "Clothing":
            return UIColor.init(hex: 0x8470FF)
        case "Beach":
            return UIColor.init(hex: 0xFCAF3D)
        case "Winter":
            return UIColor.init(hex: 0x82E9E3)
        case "Photography":
            return UIColor.init(hex: 0x676CFF)
        case "Hike":
            return UIColor.init(hex: 0x77E178)
        case "Swimming":
            return UIColor.init(hex: 0x8AD5FF)
        case "Business":
            return UIColor.init(hex: 0xFC8C3B)
        case "Formal":
            return UIColor.init(hex: 0x2F7CF6)
        case "Gym":
            return UIColor.init(hex: 0xBC6EF4)
        case "Party":
            return UIColor.init(hex: 0xFF6D5F)
        default:
            return UIColor.init(hex: 0x000000)
        }
    }
}

extension LuggageModel: Comparable {
    public static func < (lhs: LuggageModel, rhs: LuggageModel) -> Bool {
        lhs.category < rhs.category
    }
}
