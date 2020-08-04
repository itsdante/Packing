//
//  LuggageView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageView: View {
    @State private var selected = 0
    @State var isWarningPresented: Bool = false
    
    var trip: Trip
    
    private var homeButton: some View {
        Button(action: {
            
        }) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25, height: 21)
                .overlay(
                    Image("home-button")
            )
        }
    }
    
    private var editButton: some View {
        NavigationLink(destination: RestrictionView(trip: trip)) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25, height: 21)
                .overlay(
                    Image("edit-button")
            )
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                CustomSegmentedPickerView(selected: $selected)
                    .padding(.top, 20)
                Spacer()
                if selected == 0 {
                    if trip.luggages.filter({ $0.isCheckedIn == false }).count != 0 {
                        ScrollView {
                            ForEach(trip.luggages.filter({ $0.isCheckedIn == false })) { luggage in
                                LuggageListCard(luggage: luggage, isWarningPresented: self.$isWarningPresented)
                            }
                        }
                    }  else {
                        LuggageEmptyState(isCheckedIn: false)
                    }
                } else {
                    if trip.luggages.filter({ $0.isCheckedIn == true }).count != 0 {
                        ScrollView {
                            ForEach(trip.luggages.filter({ $0.isCheckedIn == true })) { luggage in
                                LuggageListCard(luggage: luggage, isWarningPresented:  self.$isWarningPresented)
                            }
                        }
                    }  else {
                        LuggageEmptyState(isCheckedIn: true)
                    }
                }
            }
            if isWarningPresented {
                LuggagePopup(trip: trip, isWarningPresented: self.$isWarningPresented)
            }
        }
        .navigationBarTitle("My Luggage", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: homeButton, trailing: editButton)
    }
}

#if DEBUG
struct LuggageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LuggageView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            LuggageView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif
