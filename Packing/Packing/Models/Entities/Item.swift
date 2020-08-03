//
//  Item.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var quantity: Int32
    var isCompleted: Bool
    var isCheckedIn : Bool = false
    var isCarryOn : Bool = false
    var isRestricted: Bool
    var createdAt: Date
}

#if DEBUG
let item1 = Item(name: "Passport", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemE2 = Item(name: "Copies of documents", quantity: 10, isCompleted: false, isRestricted: false, createdAt: Date())
let itemE3 = Item(name: "Boarding pass", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemE4 = Item(name: "Electronic chargers", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
let itemE5 = Item(name: "Wallet", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemE6 = Item(name: "Cell phone", quantity: 1, isCompleted: true, isRestricted: true, createdAt: Date())
let itemE7 = Item(name: "Adaptor", quantity: 2, isCompleted: true, isRestricted: false, createdAt: Date())
let itemE8 = Item(name: "Keys", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())

let itemT1 = Item(name: "Toothbrush", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemT2 = Item(name: "Toothpaste", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
let itemT3 = Item(name: "Soap", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
let itemT4 = Item(name: "Shampoo", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())
let itemT5 = Item(name: "Hand sanitizer", quantity: 1, isCompleted: false, isRestricted: true, createdAt: Date())

let itemF1 = Item(name: "Shirt", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemF2 = Item(name: "Suit Jacket", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemF3 = Item(name: "Tie", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemF4 = Item(name: "Work Belt", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemF5 = Item(name: "Work Pants", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemF6 = Item(name: "Work Shoes", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())

let itemB1 = Item(name: "Beach Bag", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemB2 = Item(name: "Beach Towel", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemB3 = Item(name: "Beach Umbrellas", quantity: 1, isCompleted: false, isRestricted: false, createdAt: Date())
let itemB4 = Item(name: "Hat", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemB5 = Item(name: "Sandals", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemB6 = Item(name: "Sunglasses", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
let itemB7 = Item(name: "Sunscreen", quantity: 1, isCompleted: true, isRestricted: true, createdAt: Date())
let itemB8 = Item(name: "Swimsuit", quantity: 1, isCompleted: true, isRestricted: false, createdAt: Date())
#endif
