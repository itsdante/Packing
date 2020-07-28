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
}
