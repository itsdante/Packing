//
//  NewTripCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 31/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomePopup: View {
    private static let poppinsSemiBold16: Font = Font.custom("Poppins-SemiBold", size: 16)
    private static let poppinsSemiBold12: Font = Font.custom("Poppins-SemiBold", size: 12)
    private static let poppinsRegular11: Font = Font.custom("Poppins-Regular", size: 11)
    
    private static let purple: Color = Color.init(UIColor(hex: 0x4C37C9))
    private static let black: Color = Color.init(UIColor(hex: 0x070707))
    
    private static let textFieldColor: Color = Color.init(UIColor.init(hex: 0xF2F2F2))
    private static let buttonColor: Color = Color.init(UIColor(hex: 0x654CFF))
    private static let cardShadowColor: Color = Color.init(UIColor(hex: 0x222F55, alpha: 0.048))
    private static let buttonShadowColor: Color = Color.init(UIColor(hex: 0x2704FE, alpha: 0.2))
    
    @EnvironmentObject var appState: AppState
    @State var isRootActive: Bool = false
    
    @ObservedObject private var keyboard = KeyboardResponder()
    @State private var newbookingNumber = ""
    @Binding var isPresented: Bool
    
    var trip: Trip = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "HKG", destinationAirport: "Hong Kong Int. Airport", destinationCity: "Hong Kong", destinationCountry: "China", departureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: restrictionArray)
    
    var body: some View {
        ZStack {
            BlurView(effect: .dark)
                .onTapGesture {
                    self.isPresented.toggle()
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.83, height: UIScreen.main.bounds.height * 0.28)
                .cornerRadius(22)
                .padding(.vertical, 5)
                .shadow(color: HomePopup.cardShadowColor, radius: 4, y: 4)
                .overlay(
                    ZStack {
                        GeometryReader { (proxy: GeometryProxy) in
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.03)
                                .foregroundColor(.clear)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .font(.system(size: 18))
                                        .font(Font.title.weight(.regular))
                                        .foregroundColor(HomePopup.black)
                                        .onTapGesture {
                                            self.isPresented.toggle()
                                    }
                            ).frame(width: proxy.size.width - 43, height:proxy.size.height - 37, alignment: .topTrailing)
                        }
                        VStack {
                            Text("Let's fetch your flight details")
                                .font(HomePopup.poppinsSemiBold16)
                                .foregroundColor(HomePopup.purple)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(HomePopup.textFieldColor)
                                .overlay(
                                    TextField("Input your booking number", text: self.$newbookingNumber, onCommit: {
                                        // Call to API
                                    })
                                        .font(HomePopup.poppinsRegular11)
                                        .multilineTextAlignment(TextAlignment.center)
                                        .autocapitalization(.allCharacters)
                                        .disableAutocorrection(true)
                                        .padding(10)
                            ).frame(width: UIScreen.main.bounds.width * 0.53, height: UIScreen.main.bounds.height * 0.04)
                            NavigationLink(destination: FlightInfoPage(trip: trip), isActive: $isRootActive) {
                                RoundedRectangle(cornerRadius: 18)
                                    .shadow(color: HomePopup.buttonShadowColor, radius: 4, y: 5)
                                    .overlay(
                                        Text("Add New Trip")
                                            .font(HomePopup.poppinsSemiBold12)
                                            .foregroundColor(.white)
                                )
                            }
                            .isDetailLink(false)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.04)
                            .foregroundColor(HomePopup.buttonColor)
                            .padding(.top, 20)
                        }
                    }
            )
                .padding(.bottom, keyboard.currentHeight)
                .edgesIgnoringSafeArea(.bottom)
        }
        .onReceive(self.appState.$moveToRoot) { moveToDashboard in
            if moveToDashboard {
                self.isRootActive = false
                self.appState.moveToRoot = false
            }
        }
    }
}

#if DEBUG
//struct NewTripCard_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            StatefulPreviewWrapper(false) {
//                HomePopup(isPresented: $0)
//                    .environmentObject(AppState())
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                    .previewDisplayName("iPhone 8")
//            }
//
//            StatefulPreviewWrapper(false) {
//                HomePopup(isPresented: $0)
//                    .environmentObject(AppState())
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                    .previewDisplayName("iPhone 11")
//            }
//        }
//    }
//}
#endif
