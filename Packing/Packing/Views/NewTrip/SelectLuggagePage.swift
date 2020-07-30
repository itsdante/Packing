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
                    .font(.custom("SF Pro Display", size: 14))
                    .fontWeight(.regular)
            }
            .position(x: UIScreen.main.bounds.width * 0.38, y: UIScreen.main.bounds.height * 0.04)
            LuggageCard(isCarryOn: false, isCheckedIn: false, luggage: $luggage)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            NavigationLink(destination: LuggageView(trip: Trip(
                bookingNumber: "71938JC",
                airline: "Lion Air",
                flightNumber: "GA4828",
                origin: "CGK",
                destination: "HND",
                departureDate: Date(),
                arrivalDate: Date(),
                createdAt: Date(),
                luggages: luggageArray,
                restrictions: restrictionArray)))
            {
            Image("ButtonL")
            .renderingMode(.original)
            .frame(width: UIScreen.main.bounds.width * 0.76, height: UIScreen.main.bounds.height * 0.045)
                
                
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
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
            self.isCarryOn = true
            self.isCheckedIn = false
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
            self.isCarryOn = false
            self.isCheckedIn = true
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
    


