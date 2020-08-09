//
//  HomeView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 30/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    init() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        
        // this only applies to big titles
        appearance.largeTitleTextAttributes = [
            .font : UIFont(name: "Poppins-SemiBold", size: 28) ?? UIFont.systemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor : UIColor.init(hex: 0x4E4D4D)
        ]
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 18, weight: .semibold),
            NSAttributedString.Key.foregroundColor : UIColor.init(hex: 0x4E4D4D)
        ]
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = UIColor.init(hex: 0x4E4D4D)
    }
    
    private static let darkGrey: Color = Color.init(UIColor.init(hex: 0x4E4D4D))
    private static let lightGrey: Color = Color.init(UIColor.init(hex: 0x999999))
    private static let lightPurple: Color = Color.init(UIColor.init(hex: 0x9388D4))
    private static let yellow: Color = Color.init(UIColor.init(hex: 0xF9B710))
    
    private static let buttonShadowColor: Color = Color.init(UIColor.init(hex: 0xD58411, alpha: 0.21))
    
    private static let poppinsSemiBold28: Font = Font.custom("Poppins-SemiBold", size: 28)
    private static let poppinsMedium20: Font = Font.custom("Poppins-Medium", size: 20)
    private static let poppinsMedium12: Font = Font.custom("Poppins-Medium", size: 12)
    private static let poppinsRegular14: Font = Font.custom("Poppins-Regular", size: 14)
    
    @EnvironmentObject var appState: AppState
    @State var isNavigationBarHidden: Bool = true
    
    @ObservedObject var networkManager = NetworkManager()
    @State var isPresented = false
    @State var pageIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                if appState.didLaunchBefore == false {
                    OnboardingView()
                } else {
                    if tripArray.isEmpty {
                        VStack(alignment: .center) {
                            HStack(alignment: .center) {
                                Text("New Trip")
                                    .font(HomeView.poppinsSemiBold28)
                                    .foregroundColor(HomeView.darkGrey)
                                Spacer()
                            }
                            .padding(.horizontal, 35)
                            HomeInitialCard()
                        }
                        .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.4)
                    } else {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .center) {
                                if tripArray[pageIndex].departureDate <= Date() {
                                    Text("Trip History")
                                        .font(HomeView.poppinsSemiBold28)
                                        .foregroundColor(HomeView.darkGrey)
                                } else {
                                    Text("Upcoming Trip")
                                        .font(HomeView.poppinsSemiBold28)
                                        .foregroundColor(HomeView.darkGrey)
                                }
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
                            HomeScrollView(pageIndex: self.$pageIndex, trips: tripArray)
                            if tripArray[pageIndex].departureDate <= Date() {
                                Text("Weather for Post Trip")
                                    .font(HomeView.poppinsMedium20)
                                    .foregroundColor(HomeView.darkGrey)
                                    .padding(.leading, 35)
                            } else {
                                Text("Weather for Upcoming Trip")
                                    .font(HomeView.poppinsMedium20)
                                    .foregroundColor(HomeView.darkGrey)
                                    .padding(.leading, 35)
                            }
                            Text("\(tripArray[pageIndex].destinationCity), \(tripArray[pageIndex].destinationCountry) - \(dayMonthFormatter.string(from: Date())) to \(dayMonthYearFormatter.string(from: Calendar.current.date(byAdding: .day, value: 5, to: Date())!))")
                                .font(HomeView.poppinsMedium12)
                                .foregroundColor(HomeView.lightPurple)
                                .padding(.leading, 35)
                            WeatherScrollView(weathers: networkManager.weathers)
                                .onAppear {
                                    self.networkManager.fetchData(cityName: tripArray[self.pageIndex].rawDestinationCity)
                            }
                            Text("OpenWeather")
                                .font(HomeView.poppinsRegular14)
                                .foregroundColor(HomeView.lightGrey)
                                .padding(.leading, 35)
                        }
                    }
                    if isPresented {
                        HomePopup(isPresented: self.$isPresented, trip: tripArray[pageIndex])
                    }
                }
            }
            .navigationBarTitle("Home")
            .navigationBarHidden(isNavigationBarHidden)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                self.isPresented = false
                self.isNavigationBarHidden = true
            }
            .onReceive(self.appState.$isNavigationBarHidden) { (isNavBarHidden) in
                if !isNavBarHidden {
                    self.isNavigationBarHidden = false
                }
            }
            .animation(.linear)
        }   
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .environmentObject(AppState())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            HomeView()
                .environmentObject(AppState())
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif
