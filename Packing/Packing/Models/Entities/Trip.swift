//
//  Trip.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Trip: Identifiable {
    var id: String = UUID().uuidString
    var bookingNumber: String
    var airline: String
    var flightNumber: String
    var origin: String
    var destination: String
    var departureDate: Date
    var arrivalDate: Date
    var createdAt: Date
    var luggages: [Luggage]
    var restrictions: [Restriction]
}

#if DEBUG
let luggageArray = [luggage1, luggage2]
let restrictionArray = [Restriction(mainTitle: .restrictedArticles), Restriction(mainTitle: .dangerousGoods), Restriction(mainTitle: .liquids), Restriction(mainTitle: .batteries)]
let trip = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", origin: "CGK", destination: "HND", departureDate: Date(), arrivalDate: Date(), createdAt: Date(), luggages: luggageArray, restrictions: restrictionArray)
#endif
