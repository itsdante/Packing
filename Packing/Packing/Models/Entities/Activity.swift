//
//  Activity.swift
//  Packing
//
//  Created by Dante on 05/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct ActivitiesModel: Codable {
    var data:[Activity]
}
struct Activity: Codable, Identifiable {
    var id : Int
    var imageUrl:String
    var selectUrlImage:String
    
    enum CodingKeys: String,CodingKey{
        case id, imageUrl = "image_url",selectUrlImage = "select_image_url"
    }
    
}


