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
    
    @State private var trip = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "HKG", destinationAirport: "Hong Kong Int. Airport", destinationCity: "Hong Kong", destinationCountry: "China", departureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)
    
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
                                .padding(10)
                    ).frame(width: UIScreen.main.bounds.width * 0.53, height: UIScreen.main.bounds.height * 0.04)
                    NavigationLink(destination: FlightInfoPage(trip: trip), isActive: $isRootActive) {
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
