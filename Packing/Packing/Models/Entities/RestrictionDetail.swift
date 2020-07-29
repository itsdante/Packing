//
//  RestrictionDetail.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct RestrictionDetail: Identifiable {
    enum SubTitle {
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
    var subTitle: SubTitle
    
    var subTitleString: String {
        switch subTitle {
        case .explosives:
            return "Explosives"
        case .firearms:
            return "Firearms"
        case .stunningDevices:
            return "Stunning Devices"
        case .sharpObjects:
            return "Sharp Objects"
        case .workerTools:
            return "Worker's Tools"
        case .bluntInstruments:
            return "Blunt Instruments"
        case .gases:
            return "Gases"
        case .flammableLiquids:
            return "Flammable Liquids"
        case .flammableSolids:
            return "Flammable Solids"
        case .oxidizingSubstances:
            return "Oxidizing Subsstances"
        case .toxicSubstances:
            return "Toxic Substrances"
        case .radioactiveMaterial:
            return "Radioactive Material"
        case .corrosiveSubstances:
            return "Corrosive Substances"
        case .drinks:
            return "Drinks"
        case .food:
            return "Foods"
        case .cosmetics:
            return "Cosmetics"
        case .sprays:
            return "Sprays"
        case .paste:
            return "Paste"
        case .gels:
            return "Gels"
        case .electronicDevices:
            return "Electronic Devices"
        case .spareBatteries:
            return "Spare Batteries"
        case .portableCharger:
            return "Portable Charger"
        }
    }
    
    var image: String {
        switch subTitle {
        case .explosives:
            return "explosives"
        case .firearms:
            return "firearms"
        case .stunningDevices:
            return "stunning-devices"
        case .sharpObjects:
            return "sharp-objects"
        case .workerTools:
            return "worker-tools"
        case .bluntInstruments:
            return "blunt-instruments"
        case .gases:
            return "gases"
        case .flammableLiquids:
            return "flammable-liquids"
        case .flammableSolids:
            return "flammable-solids"
        case .oxidizingSubstances:
            return "oxidizing-substances"
        case .toxicSubstances:
            return "toxic-substances"
        case .radioactiveMaterial:
            return "radioactive-material"
        case .corrosiveSubstances:
            return "corrosive-substances"
        case .drinks:
            return "drinks"
        case .food:
            return "food"
        case .cosmetics:
            return "cosmetics"
        case .sprays:
            return "sprays"
        case .paste:
            return "paste"
        case .gels:
            return "gels"
        case .electronicDevices:
            return "electronic-devices"
        case .spareBatteries:
            return "spare-batteries"
        case .portableCharger:
            return "portable-charger"
        }
    }
    
    var subDetail: String {
        switch subTitle {
        case .explosives:
            return "Ammunition, grenades"
        case .firearms:
            return "Guns, pistols, toy guns"
        case .stunningDevices:
            return "Stun guns, pepper spray"
        case .sharpObjects:
            return "Razors, knives, scissors"
        case .workerTools:
            return "Drills, saws, pliers"
        case .bluntInstruments:
            return "Baseball bats, golf clubs"
        case .gases:
            return "Gas cylinder, aerosols"
        case .flammableLiquids:
            return "Lighter refills, paint"
        case .flammableSolids:
            return "Matches"
        case .oxidizingSubstances:
            return "Bleach, hydrogen peroxide"
        case .toxicSubstances:
            return "Pesticide, mercury"
        case .radioactiveMaterial:
            return "Medical therapy equipment"
        case .corrosiveSubstances:
            return "Battery acid, ammonia"
        case .drinks:
            return "Water, soup, syrup"
        case .food:
            return "Sauces, high liquid content"
        case .cosmetics:
            return "Cream, lotion, perfumes"
        case .sprays:
            return "Hairspray, shaving foam"
        case .paste:
            return "Toothpaste"
        case .gels:
            return "Hair gel, shower gel"
        case .electronicDevices:
            return "Phones, cameras, laptops"
        case .spareBatteries:
            return "Lithium batteries"
        case .portableCharger:
            return "Must not exceed 100Wh"
        }
    }
}

#if DEBUG

#endif
