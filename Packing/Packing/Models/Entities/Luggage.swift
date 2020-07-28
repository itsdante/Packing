//
//  Luggage.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import UIKit

struct Luggage: Identifiable {
    var id: String = UUID().uuidString
    var category: String
    var isCheckedIn: Bool
    var items: [Item]
    
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
        case "Winter Sport":
            return UIColor.init(hex: 0x82E9E3)
        case "Photography":
            return UIColor.init(hex: 0x676CFF)
        case "Hike":
            return UIColor.init(hex: 0x77E178)
        case "Swimming":
            return UIColor.init(hex: 0x8AD5FF)
        case "Business":
            return UIColor.init(hex: 0xFC8C3B)
        case "Formal Events":
            return UIColor.init(hex: 0x2F7CF6)
        case "Gym":
            return UIColor.init(hex: 0xBC6EF4)
        case "Party/Festivals":
            return UIColor.init(hex: 0xFF6D5F)
        default:
            return UIColor.init(hex: 0x8E8E93)
        }
    }
}

#if DEBUG
let itemArray1 = [item1, item2, item3]
let luggage1 = Luggage(category: "Essentials", isCheckedIn: false, items: itemArray1)

let itemArray2 = [item4, item5, item6, item7]
let luggage2 = Luggage(category: "Toiletries", isCheckedIn: false, items: itemArray2)
#endif
