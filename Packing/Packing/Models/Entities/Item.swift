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
    var createdAt: Date
}

#if DEBUG
let item1 = Item(name: "Passport", quantity: 1, isCompleted: false, createdAt: Date())
let item2 = Item(name: "Documents", quantity: 1, isCompleted: false, createdAt: Date())
let item3 = Item(name: "Wallet", quantity: 1, isCompleted: true, createdAt: Date())

let item4 = Item(name: "Toothbrush", quantity: 1, isCompleted: false, createdAt: Date())
let item5 = Item(name: "Toothpaste", quantity: 1, isCompleted: false, createdAt: Date())
let item6 = Item(name: "Soap", quantity: 1, isCompleted: true, createdAt: Date())
let item7 = Item(name: "Shampoo", quantity: 1, isCompleted: true, createdAt: Date())
#endif
