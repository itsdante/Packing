//
//  Trip.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct Trip: Identifiable, Equatable {
    static func == (lhs: Trip, rhs: Trip) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String = UUID().uuidString
    var bookingNumber: String
    var airline: String
    var flightNumber: String
    var originAirport: String
    var originCity: String
    var originCountry: String
    var destinationAirport: String
    var destinationCity: String
    var destinationCountry:  String
    var departureDate: Date
    var arrivalDate: Date
    var createdAt: Date
    var luggages: [Luggage]
    var restrictions: [Restriction]
    
    var rawDestinationCity: String {
        return destinationCity.replacingOccurrences(of: " ", with: "").lowercased()
    }
}

#if DEBUG
let restrictionArray = [Restriction(mainTitle: .restrictedArticles), Restriction(mainTitle: .dangerousGoods), Restriction(mainTitle: .liquids), Restriction(mainTitle: .batteries)]

let luggageArray = [luggage1, luggage2, luggage3, luggage4]
let tripTestData = Trip(bookingNumber: "82049KD", airline: "Emirates", flightNumber: "HB5939", originAirport: "CGK", originCity: "Jakarta", originCountry: "Indonesia", destinationAirport: "GB", destinationCity: "London", destinationCountry: "United Kingdom", departureDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: luggageArray, restrictions: restrictionArray)

let luggageHongKong = [luggage1, luggage2]
let tripHongKong = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", originAirport: "CGK", originCity: "Jakarta", originCountry: "Indonesia", destinationAirport: "HKG", destinationCity: "Hong Kong", destinationCountry: "China", departureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: luggageHongKong, restrictions: restrictionArray)

let tripAmsterdam = Trip(bookingNumber: "60827IB", airline: "Turkish Airlines", flightNumber: "FZ3717", originAirport: "CGK", originCity: "Jakarta", originCountry: "Indonesia", destinationAirport: "NL", destinationCity: "Amsterdam", destinationCountry: "Netherlands", departureDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)

var tripArray: [Trip] = []
#endif
