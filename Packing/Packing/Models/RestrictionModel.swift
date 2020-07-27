//
//  RestrictionModel.swift
//  Packing
//
//  Created by Dante on 27/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Restriction {
    let restrictionList:[RestrictionList]
}

struct RestrictionList:Decodable {
    let title:String
    let subTitle:String
    let itemList:[ListOfItem]
}

struct ListOfItem:Decodable {
    let icon:String
    let itemName:String
    let itemDetail:String
}
