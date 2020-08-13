//
//  FlightInfoPage.swift
//  Packing
//
//  Created by Andimas Bagaswara on 09/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct FlightInfoPage: View {
    
    private static var black: Color = Color(UIColor.init(hex: 0x353535))
    private static var grey: Color = Color(UIColor.init(hex: 0x666666))
    private static var darkGrey: Color = Color(UIColor.init(hex: 0x4E4D4D))
    private static var purple: Color = Color(UIColor.init(hex: 0x4C37C9))
    private static var lightPurple: Color = Color(UIColor.init(hex: 0x9388D4))
    private static var cardShadow: Color = Color(UIColor.init(hex: 0x3A4C82, alpha: 0.0723))
    private static var buttonShadow: Color = Color(UIColor.init(hex: 0x2704FE, alpha: 0.4))
    private static var buttonColor: Color = Color(UIColor.init(hex: 0x654CFF))
    private static var bgColor: Color = Color.init(UIColor.init(hex: 0xF7F8FC))
    
    private static var poppinsBold: Font = Font.custom("Poppins-Bold", size: 28)
    private static var poppinsSemiBold28: Font = Font.custom("Poppins-SemiBold", size: 28)
    private static var poppinsSemiBold22: Font = Font.custom("Poppins-SemiBold", size: 22)
    private static var poppinsSemiBold14: Font = Font.custom("Poppins-SemiBold", size: 14)
    private static var poppinsRegular: Font = Font.custom("Poppins-Regular", size: 11)
    private static var poppinsMedium: Font = Font.custom("Poppins-Medium", size: 16)
    
    @EnvironmentObject var appState: AppState
    var trip: Trip
    
    var body: some View {
        ZStack() {
            HStack {
                VStack(alignment: .leading) {
                    Text("Booking Number")
                        .foregroundColor(FlightInfoPage.darkGrey)
                        .font(FlightInfoPage.poppinsSemiBold22)
                    Text(trip.bookingNumber)
                        .foregroundColor(FlightInfoPage.purple)
                    .font(.system(size: 28))
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .position(x: UIScreen.main.bounds.width * 0.49, y: UIScreen.main.bounds.height * 0.01)
            .padding(.horizontal, 12)
            VStack {
                HStack {
                    Text("Your Flight Overview")
                        .foregroundColor(FlightInfoPage.lightPurple)
                        .font(FlightInfoPage.poppinsMedium)
                    Spacer()
                }
                .padding(.horizontal, 23)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(UIColor.init(hex: 0xFFFFFF)))
                    .shadow(color: FlightInfoPage.cardShadow, radius: 10, y: 11)
                    .frame(width: UIScreen.main.bounds.width * 0.925, height: UIScreen.main.bounds.height * 0.2)
                    .overlay(
                        HStack {
                            InfoStack(alignment: .leading, date: basicDateFormatter.string(from: trip.departureDate), code: trip.originAirportCode, airport: trip.originAirport, time: timeFormater.string(from: trip.departureDate))
                            Spacer()
                            VStack {
                                Text(trip.flightNumber)
                                    .font(.system(size: 18, weight: .regular))
                                Image("flight-overview-icon")
                                Text("Duration: \(remainingTime(departureDate: trip.departureDate, arrivalDate: trip.arrivalDate))h")
                                    .font(FlightInfoPage.poppinsRegular)
                            }
                            Spacer()
                            InfoStack(alignment: .trailing, date: basicDateFormatter.string(from: trip.arrivalDate), code: trip.destinationAirportCode, airport: trip.destinationAirport, time: timeFormater.string(from: trip.arrivalDate))
                        }
                        .padding(.horizontal, 15)
                )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.2)
            NavigationLink(destination: SelectGenderPage(trip: trip)) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(UIColor.init(hex: 0x654CFF)))
                    .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.058)
                    .shadow(color: Color(UIColor.init(hex: 0x2704FE, alpha: 0.4)), radius: 5, y: 2)
                    .overlay(
                        Text("Next")
                            .foregroundColor(Color(UIColor.init(hex: 0xFFFFFF)))
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
        }
        .padding(.top, 35)
        .background(FlightInfoPage.bgColor.edgesIgnoringSafeArea(.all))
        .onAppear {
            self.appState.isNavigationBarHidden = false
        }
    }
    
    struct InfoStack: View {
        var alignment: HorizontalAlignment
        var date: String
        var code: String
        var airport: String
        var time: String
        
        @Environment(\.presentationMode) var mode: Binding<PresentationMode>
        
        var body: some View {
            VStack(alignment: alignment){
                Text(date)
                    .foregroundColor(FlightInfoPage.grey)
                    .font(.system(size: 12, weight: .regular))
                Text(code)
                    .foregroundColor(FlightInfoPage.purple)
                    .font(FlightInfoPage.poppinsBold)
                Text(airport)
                    .foregroundColor(FlightInfoPage.black)
                    .font(FlightInfoPage.poppinsRegular)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(alignment == .leading ? .leading : .trailing)
                Spacer()
                Text(time)
                    .foregroundColor(FlightInfoPage.black)
                    .font(.system(size: 24, weight: .semibold))
            }
            .padding(.top, 23)
            .padding(.bottom, 19)
            .navigationBarTitle("New Trip", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "arrow.left")
            })
        }
    }
}

struct FlightInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightInfoPage(trip: tripTestData).environmentObject(AppState())
        }
    }
}
