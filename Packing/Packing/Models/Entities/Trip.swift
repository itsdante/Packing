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
let luggageArray = [luggage1, luggage2, luggage3, luggage4]
let restrictionArray = [Restriction(mainTitle: .restrictedArticles), Restriction(mainTitle: .dangerousGoods), Restriction(mainTitle: .liquids), Restriction(mainTitle: .batteries)]
let tripTestData = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", origin: "CGK", destination: "HKG", departureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: luggageArray, restrictions: restrictionArray)
#endif
