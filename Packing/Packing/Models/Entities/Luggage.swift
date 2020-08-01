//
//  Luggage.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import UIKit

struct Luggage: Identifiable {
    enum Category {
        case esssentials
        case toiletries
        case clothing
        case beach
        case winter
        case photography
        case hike
        case swimming
        case business
        case formal
        case gym
        case party
    }
    
    var id: String = UUID().uuidString
    var category: Category
    var isCheckedIn: Bool
    var items: [Item]
    
    var categoryString: String {
        switch category {
        case .esssentials:
            return "Essentials"
        case .toiletries:
            return "Toiletries"
        case .clothing:
            return "Clothing"
        case .beach:
            return "Beach"
        case .winter:
            return "Winter Sport"
        case .photography:
            return "Photography"
        case .hike:
            return "Hike"
        case .swimming:
            return "Swimming"
        case .business:
            return "Business"
        case .formal:
            return "Formal Events"
        case .gym:
            return "Gym"
        case .party:
            return "Party/Festivals"
        }
    }
    
    var categoryColor: UIColor {
        switch category {
        case .esssentials:
            return UIColor.init(hex: 0xFFC738)
        case .toiletries:
            return UIColor.init(hex: 0xFF90AB)
        case .clothing:
            return UIColor.init(hex: 0x8470FF)
        case .beach:
            return UIColor.init(hex: 0xFCAF3D)
        case .winter:
            return UIColor.init(hex: 0x82E9E3)
        case .photography:
            return UIColor.init(hex: 0x676CFF)
        case .hike:
            return UIColor.init(hex: 0x77E178)
        case .swimming:
            return UIColor.init(hex: 0x8AD5FF)
        case .business:
            return UIColor.init(hex: 0xFC8C3B)
        case .formal:
            return UIColor.init(hex: 0x2F7CF6)
        case .gym:
            return UIColor.init(hex: 0xBC6EF4)
        case .party:
            return UIColor.init(hex: 0xFF6D5F)
        }
    }
}

#if DEBUG
let itemArray1 = [item1, itemE2, itemE3, itemE4, itemE5, itemE6, itemE7, itemE8]
let luggage1 = Luggage(category: .esssentials, isCheckedIn: false, items: itemArray1)

let itemArray2 = [itemT1, itemT2, itemT3, itemT4]
let luggage2 = Luggage(category: .toiletries, isCheckedIn: false, items: itemArray2)

let itemArray3 = [itemF1, itemF2, itemF3, itemF4, itemF5, itemF6]
let luggage3 = Luggage(category: .formal, isCheckedIn: true, items: itemArray3)

let itemArray4 = [itemB1, itemB2, itemB3, itemB4, itemB5, itemB6, itemB7, itemB8]
let luggage4 = Luggage(category: .beach, isCheckedIn: true, items: itemArray4)
#endif
