//
//  HomeView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 30/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    private static let darkGrey: Color = Color.init(UIColor.init(hex: 0x4E4D4D))
    private static let lightGrey: Color = Color.init(UIColor.init(hex: 0x999999))
    private static let lightPurple: Color = Color.init(UIColor.init(hex: 0x9388D4))
    private static let yellow: Color = Color.init(UIColor.init(hex: 0xF9B710))
    
    private static let buttonShadowColor: Color = Color.init(UIColor.init(hex: 0xD58411, alpha: 0.21))
    
    private static let poppinsSemiBold28: Font = Font.custom("Poppins-SemiBold", size: 28)
    private static let poppinsMedium20: Font = Font.custom("Poppins-Medium", size: 20)
    private static let poppinsMedium12: Font = Font.custom("Poppins-Medium", size: 12)
    private static let poppinsRegular14: Font = Font.custom("Poppins-Regular", size: 14)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var networkManager = NetworkManager()
    @State var isPresented = false
    var trip: Trip
    var cityName: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(trip.departureDate <= Date() ? "Trip History" : "Upcoming Trip")
                        .font(HomeView.poppinsSemiBold28)
                        .foregroundColor(HomeView.darkGrey)
                    Spacer()
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Circle()
                            .frame(width: UIScreen.main.bounds.width * 0.11, height: UIScreen.main.bounds.height * 0.05)
                            .foregroundColor(HomeView.yellow)
                            .shadow(color: HomeView.buttonShadowColor, radius: 4, y: 7)
                            .overlay(Image(systemName: "plus")
                                .font(.system(size: 24))
                                .font(Font.title.weight(.regular))
                                .foregroundColor(.white)
                        )
                    }
                }
                .padding(.horizontal, 35)
                
                // Scroll View
                HomeCard(trip: trip)
                    .padding(.horizontal, 35)
                
                Text(trip.departureDate <= Date() ? "Weather for Post Trip" : "Weather for Upcoming Trip")
                    .font(HomeView.poppinsMedium20)
                    .foregroundColor(HomeView.darkGrey)
                    .padding(.leading, 35)
                Text("Hong Kong, China - \(dayMonthFormatter.string(from: Date())) to \(dayMonthYearFormatter.string(from: Calendar.current.date(byAdding: .day, value: 5, to: Date())!))")
                    .font(HomeView.poppinsMedium12)
                    .foregroundColor(HomeView.lightPurple)
                    .padding(.leading, 35)
                WeatherScrollView(weathers: networkManager.weathers)
                    .onAppear {
                        self.networkManager.fetchData(cityName: self.cityName)
                }
                Text("OpenWeather")
                    .font(HomeView.poppinsRegular14)
                    .foregroundColor(HomeView.lightGrey)
                    .padding(.leading, 35)
            }
            if isPresented {
                HomePopup(isPresented: self.$isPresented, trip: trip)
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(trip: tripTestData, cityName: "London")
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            HomeView(trip: tripTestData, cityName: "London")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif
