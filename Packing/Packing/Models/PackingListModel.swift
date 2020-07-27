//
//  PackingListModel.swift
//  Packing
//
//  Created by Dante on 27/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct PackingList {
    let wrappedCategory:String
    let categoryColor:String
    let itemList:[ListItem]
}
struct ListItem {
    let checked:Bool
    let detail:String
    let icon:String
    let value:Int
    let checkIn:Bool
}
