//
//  RestrictionItem.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Restriction: Identifiable {
    enum MainTitle {
        case restrictedArticles
        case dangerousGoods
        case liquids
        case batteries
    }
    
    var id: String = UUID().uuidString
    var mainTitle: MainTitle
    
    var mainTitleString: String {
        switch mainTitle {
        case .restrictedArticles:
            return "Restricted Articles"
        case .dangerousGoods:
            return "Dangerous Goods"
        case .liquids:
            return "Restrictions on Liquids, Aerosols & Gels"
        case .batteries:
            return "Lithium Batteries & Portable Battery Charger"
        }
    }
    
    var mainDetail: String {
        switch mainTitle {
        case .restrictedArticles:
            return "Do not pack restricted articles in your checked or hand baggage, or carry it on person."
        case .dangerousGoods:
            return "Do not pack any dangerous goods such as flammable liquids, corrosive substances and gas cylinders in either your checked or hand baggage as they pose a risk to the safety of the aircraft."
        case .liquids:
            return "All liquids, aerosols and gels (LAGs) in hand baggage should be placed in containers no larger than 100ml and packed in a transparent re-sealable plastic bag with a capacity of 1 litre or less. Only one transparent plastic bag per passenger is permitted."
        case .batteries:
            return "Spare Lithium batteries and portable power banks must NOT be placed in checked baggage."
        }
    }
    
    var restrictionDetail: [RestrictionDetail] {
        switch mainTitle {
        case .restrictedArticles:
            return [
                RestrictionDetail(subTitle: .explosives),
                RestrictionDetail(subTitle: .firearms),
                RestrictionDetail(subTitle: .stunningDevices),
                RestrictionDetail(subTitle: .sharpObjects),
                RestrictionDetail(subTitle: .workerTools),
                RestrictionDetail(subTitle: .bluntInstruments)
            ]
        case .dangerousGoods:
            return [
                RestrictionDetail(subTitle: .explosives),
                RestrictionDetail(subTitle: .gases),
                RestrictionDetail(subTitle: .flammableLiquids),
                RestrictionDetail(subTitle: .flammableSolids),
                RestrictionDetail(subTitle: .oxidizingSubstances),
                RestrictionDetail(subTitle: .toxicSubstances),
                RestrictionDetail(subTitle: .radioactiveMaterial),
                RestrictionDetail(subTitle: .corrosiveSubstances),
            ]
        case .liquids:
            return [
                RestrictionDetail(subTitle: .drinks),
                RestrictionDetail(subTitle: .food),
                RestrictionDetail(subTitle: .cosmetics),
                RestrictionDetail(subTitle: .sprays),
                RestrictionDetail(subTitle: .paste),
                RestrictionDetail(subTitle: .gels)
            ]
        case .batteries:
            return [
                RestrictionDetail(subTitle: .electronicDevices),
                RestrictionDetail(subTitle: .spareBatteries),
                RestrictionDetail(subTitle: .portableCharger)
            ]
        }
    }
}

#if DEBUG

#endif
