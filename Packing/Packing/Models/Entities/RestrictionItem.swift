//
//  RestrictionItem.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Restriction {
    enum MainTitle {
        case explosives
        case firearms
        case stunningDevices
        case sharpObjects
        case workerTools
        case bluntInstruments
        case gases
        case flammableLiquids
        case flammableSolids
        case oxidizingSubstances
        case toxicSubstances
        case radioactiveMaterial
        case corrosiveSubstances
        case drinks
        case food
        case cosmetics
        case sprays
        case paste
        case gels
        case electronicDevices
        case spareBatteries
        case portableCharger
    }
    
    var id: String = UUID().uuidString
    var mainTitle: MainTitle
    var mainDetails: String
    
    
}
