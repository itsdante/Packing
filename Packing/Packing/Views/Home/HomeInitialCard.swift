//
//  HomeEmptyCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomeInitialCard: View {
    private static var poppinsSemiBold16: Font = Font.custom("Poppins-SemiBold", size: 16)
    private static var poppinsSemiBold12: Font = Font.custom("Poppins-SemiBold", size: 12)
    private static let poppinsRegular11: Font = Font.custom("Poppins-Regular", size: 11)
    
    private static var darkGrey: Color = Color.init(UIColor.init(hex: 0x4E4D4D))
    private static var darkPurple: Color = Color.init(UIColor.init(hex: 0x4C37C9))
    private static var buttonColor: Color = Color.init(UIColor(hex: 0x654DFF))
    private static let lightGrey: Color = Color.init(UIColor.init(hex: 0xF2F2F2))
    
    private static var buttonShadowColor: Color = Color.init(UIColor.init(hex: 0x2704FE, alpha: 0.2))
    private static var cardShadowColor: Color = Color.init(UIColor.init(hex: 0x4230B2, alpha: 0.1))
    
    @EnvironmentObject var appState: AppState
    @State var isRootActive: Bool = false
    
    @ObservedObject private var keyboard = KeyboardResponder()
    @State private var newbookingNumber = ""
    

    let BookCode = ["60827IB","71938JC","82049KD","28327JT"]

    func checkTripReal(x: String) -> Bool {
        if BookCode.contains(x)
        {
            return false
        }
        return true
    }
    
    @State var isRealTrip: Bool = false

    func checkTrip(x: String) -> Trip {
        if x == "71938JC" {
          return Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "HKG", destinationAirport: "Hong Kong Int. Airport", destinationCity: "Hong Kong", destinationCountry: "China", departureDate: Calendar.current.date(byAdding: .hour, value: 24, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: [])
        }
        else if x == "28327JT"
        {
            return Trip(bookingNumber: "28327JT", airline: "All Nippon Airways", flightNumber: "PN3827", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "NRT", destinationAirport: "Tokyo Narita Airport", destinationCity: "Tokyo", destinationCountry: "Japan", departureDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)
        }
        else if x == "60827IB"
        {
            return Trip(bookingNumber: "60827IB", airline: "Turkish Airlines", flightNumber: "FZ3717", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "AMS", destinationAirport: "Amsterdam Airport Schiphol", destinationCity: "Amsterdam", destinationCountry: "Netherlands", departureDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)
        }
        else if x == "82049KD"
        {
           return Trip(bookingNumber: "82049KD", airline: "Emirates", flightNumber: "HB5939", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "LHR", destinationAirport: "London Heathrow Airport", destinationCity: "London", destinationCountry: "United Kingdom", departureDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: luggageArray, restrictions: restrictionArray)
        }
        return Trip(bookingNumber: "28327JT", airline: "All Nippon Airways", flightNumber: "PN3827", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "NRT", destinationAirport: "Tokyo Narita Airport", destinationCity: "Tokyo", destinationCountry: "Japan", departureDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)
    }
    
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.clear)
                .overlay(
                    VStack {
                        Image("home-empty-background-image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
                        Spacer()
                    }
            )
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                VStack(alignment: .center) {
                    Text("Let’s fetch your flight details")
                        .font(HomeInitialCard.poppinsSemiBold16)
                        .foregroundColor(HomeInitialCard.darkPurple)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(HomeInitialCard.lightGrey)
                        .overlay(
                            TextField("Input your booking number", text: self.$newbookingNumber, onCommit: {
                                // Call to API
                            })
                                .font(HomeInitialCard.poppinsRegular11)
                                .multilineTextAlignment(TextAlignment.center)
                                .autocapitalization(.allCharacters)
                                .disableAutocorrection(true)
                                .padding(10)
                    ).frame(width: UIScreen.main.bounds.width * 0.53, height: UIScreen.main.bounds.height * 0.04)
                    
                    NavigationLink(destination: FlightInfoPage(trip: checkTrip(x: self.newbookingNumber)), isActive: $isRootActive) {
                        RoundedRectangle(cornerRadius: 18)
                            .shadow(color: HomeInitialCard.buttonShadowColor, radius: 4, y: 5)
                            .overlay(
                                Text("Add New Trip")
                                    .font(HomeInitialCard.poppinsSemiBold12)
                                    .foregroundColor(.white)
                        )
                        }
                        
                    .isDetailLink(false)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.04)
                    .foregroundColor(HomeInitialCard.buttonColor)
                    .padding(.top, 20)
                    .disabled(checkTripReal(x: self.newbookingNumber))
                    .simultaneousGesture(TapGesture().onEnded{
                        
                        if self.checkTripReal(x: self.newbookingNumber)
                        {
                            self.isRealTrip.toggle()
                        }
                    })
                }
            }
            .frame(height: UIScreen.main.bounds.width * 0.45)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.66)
        .cornerRadius(40)
        .shadow(color: HomeInitialCard.cardShadowColor, radius: 4, y: 4)
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(self.appState.$moveToRoot) { moveToDashboard in
            if moveToDashboard {
                self.isRootActive = false
                self.appState.moveToRoot = false
            }
        }.alert(isPresented: self.$isRealTrip)
        {
            Alert(title: Text("Flight Not Found"), message: Text("The booking code that you input is not valid"), dismissButton: nil)
        }
    }
}

#if DEBUG
struct HomeEmptyCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeInitialCard()
                .environmentObject(AppState())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            HomeInitialCard()
                .environmentObject(AppState())
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif
