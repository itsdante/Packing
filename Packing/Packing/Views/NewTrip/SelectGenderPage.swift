//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectGenderPage: View {
    @State var selectedGender = ""
    
    var trip: Trip
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Gender")
                    .font(.custom("Poppins-SemiBold", size: 22))
                    .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("Choose Your Gender")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
            .position(x: UIScreen.main.bounds.width * 0.27, y: UIScreen.main.bounds.height * 0)
            
            HStack {
                Button(action: {
                    self.selectedGender = "Male"
                }) {
                    if (self.selectedGender == "Male") {
                        Image("ManSelected")
                            .renderingMode(.original)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                    } else {
                        Image("Man")
                            .renderingMode(.original)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                    }
                }
                
                Spacer()
                    .frame(width: UIScreen.main.bounds.width * 0.05)
                
                Button(action: {
                    self.selectedGender = "Female"
                }) {
                    if (self.selectedGender == "Female") {
                        Image("WomanSelected")
                            .renderingMode(.original)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                    } else {
                        Image("Woman")
                            .renderingMode(.original)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                    }
                }
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            
            if selectedGender != "" {
                NavigationLink(destination: SelectLuggagePage(selectedGender: selectedGender, trip: trip)) {
                    Image("ButtonL")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.05)
                }
                .buttonStyle(PlainButtonStyle())
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
            }
        }
    }
}

struct SelectGenderPage_Previews: PreviewProvider {
    static var previews: some View {
        SelectGenderPage(trip: tripTestData)
    }
}
