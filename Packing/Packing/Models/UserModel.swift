//
//  UserModel.swift
//  Packing
//
//  Created by Dante on 27/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct UserModel {
    let basicProfile:basicData
}

struct basicData:Decodable {
    let gender:String
    let activities:[activityList]
}
struct activityList:Decodable {
    let activity:String
    let imageUrl:String
}
