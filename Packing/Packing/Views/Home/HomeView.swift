//
//  HomeView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 30/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var trip: Trip
    
    var body: some View {
        NavigationView {
            VStack() {
                HomeCard(trip: trip)
                WeatherView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(trip: tripTestData)
    }
}
