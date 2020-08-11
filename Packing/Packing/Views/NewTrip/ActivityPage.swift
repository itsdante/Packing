//
//  ContentView.swift
//  MC3ActivitiesProduct
//
//  Created by Laurentius Richard Reynaldo on 24/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct ActivityPage: View {
    @EnvironmentObject var appState: AppState
    @State var selectedActivity: [Luggage] = []
    
    let activities : [String] = ["beach", "hike", "formal", "winter", "swimming", "gym", "photography", "business", "party"]
    
    var selectedGender: String
    var selectedLuggage: [Int]
    @State var trip: Trip
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Activities")
                    .font(.custom("Poppins-SemiBold", size: 22))
                    .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("What Activities Will You Do")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.1)
            .position(x: UIScreen.main.bounds.width * 0.33, y: UIScreen.main.bounds.height * 0)
            VStack(spacing: 41) {
                HStack(spacing: 18) {
                    ForEach(0 ..< 3) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage)
                    }
                }
                HStack(spacing: 18) {
                    ForEach(3 ..< 6) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage)
                    }
                }
                HStack(spacing: 18) {
                    ForEach(6 ..< 9) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage)
                    }
                }
            }.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.34)
            Button(action: {
                self.selectedActivity.append(Luggage(category: .esssentials, isCheckedIn: self.selectedLuggage.contains(1) ? false : true, gender: self.selectedGender, items: returnItem(gender: self.selectedGender, category: .esssentials, isCheckedIn: self.selectedLuggage.contains(1) ? false : true)))
                self.selectedActivity.append(Luggage(category: .toiletries, isCheckedIn: self.selectedLuggage.contains(1) ? false : true, gender: self.selectedGender, items: returnItem(gender: self.selectedGender, category: .toiletries, isCheckedIn: self.selectedLuggage.contains(1) ? false : true)))
                self.selectedActivity.append(Luggage(category: .clothing, isCheckedIn: self.selectedLuggage.contains(1) ? false : true, gender: self.selectedGender, items: returnItem(gender: self.selectedGender, category: .clothing, isCheckedIn: self.selectedLuggage.contains(1) ? false : true)))
                self.trip.luggages = self.selectedActivity
                tripArray.append(self.trip)
                self.appState.moveToRoot = true
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(UIColor.init(hex: 0x654CFF)))
                    .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.058)
                    .shadow(color: Color(UIColor.init(hex: 0x2704FE, alpha: 0.4)), radius: 5, y: 2)
                    .overlay(
                        Text("Next")
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
        }
    }
}

struct ActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ActivityPage(selectedGender: "Male", selectedLuggage: [1,2], trip: tripTestData)
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        .previewDisplayName("iPhone 11")
    }
}
