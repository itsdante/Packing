//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectLuggagePage: View {
    
    @State var luggage : String
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 6){
                Text("Luggage")
                    .font(.custom("Poppins-SemiBold", size: 22))
                Text("What Kind of Luggage Will You Bring?")
                    .font(.custom("Poppins-SemiBold", size: 14))
                    .fontWeight(.regular)
                .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }
            .position(x: UIScreen.main.bounds.width * 0.38, y: UIScreen.main.bounds.height * 0.04)
            LuggageCard(isCarryOn: false, isCheckedIn: false, luggage: $luggage)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            NavigationLink(destination: LuggageView(trip: trip))
            {
                Image("ButtonL")
                    .resizable()
                    .aspectRatio(
                        contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.936,
                        height: UIScreen.main.bounds.height * 0.05)
                    .position(
                        x: UIScreen.main.bounds.width / 2,
                        y: UIScreen.main.bounds.height * 0.27)
            }.buttonStyle(
                PlainButtonStyle())
                .position(
                    x: UIScreen.main.bounds.width / 2,
                    y: UIScreen.main.bounds.height * 0.81)
        }
        
    }
}

struct SelectLuggagePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectLuggagePage(luggage: "")
    }
}

struct LuggageCard: View {
    @State var isCarryOn : Bool
    @State var isCheckedIn : Bool
    @Binding var luggage : String
    var body: some View {
    HStack {
        Button(action: {
            self.isCarryOn.toggle()
            self.luggage = "CarryOn"
            print("asdadsdsadasda1")
        }){
            if(isCarryOn == true)
            {
                Image("CarryOnSelected")
                .renderingMode(.original)
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: UIScreen.main.bounds.height * 0.23)
            }
            else
            {
            Image("CarryOn")
                .renderingMode(.original)
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: UIScreen.main.bounds.height * 0.23)
            }
        }
        
        
        
        Spacer()
            .frame(width: UIScreen.main.bounds.width * 0.05)
        Button(action: {
            self.isCheckedIn.toggle()
            self.luggage = "CheckIn"
            print("asdadsdsadasda1")
        }){
            
            if(isCheckedIn == true)
            {
                Image("CheckInSelected")
                .renderingMode(.original)
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: UIScreen.main.bounds.height * 0.23)
            }
            else
            {
            Image("CheckIn")
                .renderingMode(.original)
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: UIScreen.main.bounds.height * 0.23)
            
            }
            
        }
        }
    }
    }
    


