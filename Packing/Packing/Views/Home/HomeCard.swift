//
//  HomeCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 30/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomeCard: View {
    private static var cardShadowColor: Color = Color.init(UIColor.init(hex: 0x4230B2, alpha: 0.1))
    
    private static var poppinsSemiBold18: Font = Font.custom("Poppins-SemiBold", size: 18)
    private static var poppinsSemiBold12: Font = Font.custom("Poppins-SemiBold", size: 12)
    private static var poppinseMedium18: Font = Font.custom("Poppins-Medium", size: 18)
    private static var poppinseMedium12: Font = Font.custom("Poppins-Medium", size: 12)
    private static var systemBold: Font = Font.title.weight(.bold)
    
    private static var lightPurple: Color = Color.init(UIColor.init(hex: 0x9388D4))
    private static var darkPurple: Color = Color.init(UIColor.init(hex: 0x4C37C9))
    private static var lightGrey: Color = Color.init(UIColor.init(hex: 0x676767))
    private static var darkGrey: Color = Color.init(UIColor.init(hex: 0x4E4D4D))
    
    private static var buttonColor: Color = Color.init(UIColor(hex: 0x654DFF))
    private static var buttonShadowColor: Color = Color.init(UIColor.init(hex: 0x2704FE, alpha: 0.2))
    
    var trip: TripModel
    func checkDepartureTime(x:Int) -> String {
        if x < 24
        {
            
            return "Your flight is in \(remainingTime(departureDate: Date(), arrivalDate: trip.departureDate)) hours"
        }
        else
        {
            return "Your flight is in \(remainingDays(departureDate: Date(), arrivalDate: trip.departureDate)) days"
        }
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.clear)
                .overlay(
                    Image("home-background-image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)
            )
                .clipped()
                .contentShape(Rectangle())
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                VStack(alignment: .center) {
                    Text(trip.departureDate <= Date() ? "Past Trip" : checkDepartureTime(x: remainingTime(departureDate: Date(), arrivalDate: trip.departureDate)))
                        .font(HomeCard.poppinsSemiBold18)
                        .foregroundColor(HomeCard.darkPurple)
                    ZStack {
                        Image("home-flight-icon")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.height * 0.025)
                        HStack(alignment: .center) {
                            InfoStack(country: trip.originCountry, city: trip.originCity, time: timeFormater.string(from: trip.departureDate), date: dateFormatter.string(from: trip.departureDate))
                                .padding(.leading, 30)
                            Spacer()
                            InfoStack(country: trip.destinationCountry, city: trip.destinationCity, time: timeFormater.string(from: trip.arrivalDate), date: dateFormatter.string(from: trip.arrivalDate))
                                .padding(.trailing, 30)
                        }
                    }
                    NavigationLink(destination: LuggageView(uuid: trip.id)) {
                        RoundedRectangle(cornerRadius: 18)
                            .shadow(color: HomeCard.buttonShadowColor, radius: 4, y: 5)
                            .overlay(
                                Text("View Packing List")
                                    .font(HomeCard.poppinsSemiBold12)
                                    .foregroundColor(.white)
                        )
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.04)
                    .foregroundColor(HomeCard.buttonColor)
                    .padding(.top, 25)
                }
            }
            .frame(height: UIScreen.main.bounds.width * 0.6)
            .cornerRadius(40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
        .cornerRadius(40)
        .shadow(color: HomeCard.cardShadowColor, radius: 4, y: 4)
    }
    
    struct InfoStack: View {
        var country: String
        var city: String
        var time: String
        var date: String
        
        var body: some View {
            VStack {
                Text(country)
                    .font(HomeCard.poppinseMedium12)
                    .foregroundColor(HomeCard.lightPurple)
                Text(city)
                    .font(HomeCard.poppinseMedium18)
                    .foregroundColor(HomeCard.darkGrey)
                Text(time)
                    .font(HomeCard.systemBold)
                    .font(.system(size: 24))
                    .foregroundColor(HomeCard.darkPurple)
                Text(date)
                    .font(HomeCard.poppinseMedium12)
                    .foregroundColor(HomeCard.lightGrey)
            }
        }
    }
}

#if DEBUG
//struct HomeCard_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeCard(trip: tripTestData)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("iPhone 8")
//            
//            HomeCard(trip: tripTestData)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif
