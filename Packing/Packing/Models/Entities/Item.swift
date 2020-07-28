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
