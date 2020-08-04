//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectLuggagePage: View {
    @State var selectedLuggage: [Int] = []
    
    var selectedGender: String
    var trip: Trip
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Luggage")
                    .font(.custom("Poppins-SemiBold", size: 22))
                    .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("What Kind of Luggage Will You Bring?")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.1)
            .position(x: UIScreen.main.bounds.width * 0.45, y: UIScreen.main.bounds.height * 0)
            
            LuggageCard(selectedLuggage: $selectedLuggage)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            
            if selectedLuggage.count != 0 {
                NavigationLink(destination: ActivityPage(selectedGender: selectedGender, selectedLuggage: selectedLuggage, trip: trip)) {
                    Image("ButtonL")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.05)
                }
                .buttonStyle(PlainButtonStyle())
                .position(
                    x: UIScreen.main.bounds.width / 2,
                    y: UIScreen.main.bounds.height * 0.7)
            }
        }
    }
}

struct LuggageCard: View {
    @Binding var selectedLuggage: [Int]
    
    var body: some View {
        HStack {
            Button(action: {
                if self.selectedLuggage.contains(1) {
                    self.selectedLuggage.removeAll(where: { $0 == 1 })
                } else {
                    self.selectedLuggage.append(1)
                }
            }) {
                if(selectedLuggage.contains(1)) {
                    Image("CarryOnSelected")
                        .renderingMode(.original)
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                } else {
                    Image("CarryOn")
                        .renderingMode(.original)
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                }
            }
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)
            
            Button(action: {
                if self.selectedLuggage.contains(2) {
                    self.selectedLuggage.removeAll(where: { $0 == 2 })
                } else {
                    self.selectedLuggage.append(2)
                }
            }) {
                if (self.selectedLuggage.contains(2)) {
                    Image("CheckInSelected")
                        .renderingMode(.original)
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                } else {
                    Image("CheckIn")
                        .renderingMode(.original)
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                    
                }
            }
        }
    }
}

struct SelectLuggagePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectLuggagePage(selectedGender: "Male", trip: tripTestData)
    }
}
