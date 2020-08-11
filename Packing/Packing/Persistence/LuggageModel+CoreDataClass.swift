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
        return set.sorted()
    }
    
    var categoryColor: UIColor {
        switch category {
        case "essentials":
            return UIColor.init(hex: 0xFFC738)
        case "toiletries":
            return UIColor.init(hex: 0xFF90AB)
        case "clothing":
            return UIColor.init(hex: 0x8470FF)
        case "beach":
            return UIColor.init(hex: 0xFCAF3D)
        case "winter":
            return UIColor.init(hex: 0x82E9E3)
        case "photography":
            return UIColor.init(hex: 0x676CFF)
        case "hike":
            return UIColor.init(hex: 0x77E178)
        case "swimming":
            return UIColor.init(hex: 0x8AD5FF)
        case "business":
            return UIColor.init(hex: 0xFC8C3B)
        case "formal":
            return UIColor.init(hex: 0x2F7CF6)
        case "gym":
            return UIColor.init(hex: 0xBC6EF4)
        case "party":
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
