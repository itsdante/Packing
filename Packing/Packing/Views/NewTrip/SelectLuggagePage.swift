//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectLuggagePage: View {
    @State var ctr : Int
    @State var isCarryOn : Bool
    @State var isCheckedIn : Bool
    @State var luggageArrayCheckedIn : [Luggage]
//    @State var luggageArrayCarryOn : [Luggage]
    var trip: Trip
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .leading, spacing: 6){
                Text("Luggage")
                    .font(.custom("Poppins-SemiBold", size: 22))
                .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("What Kind of Luggage Will You Bring?")
                    .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.1)
            .position(x: UIScreen.main.bounds.width * 0.45, y: UIScreen.main.bounds.height * 0)
            LuggageCard(
                isCarryOn: $isCarryOn,
                isCheckedIn: $isCheckedIn,
                ctr: $ctr)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            
            
            
            if ctr != 0{
                
                
            NavigationLink(destination: LuggageView(trip: Trip(
                bookingNumber: "71938JC",
                airline: "Lion Air",
                flightNumber: "GA4828",
                origin: "CGK", destination: "HKG",
                departureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
                arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000),
                createdAt: Date(),
                luggages: luggageArrayCheckedIn,
                restrictions: restrictionArray)))
            {
                Image("ButtonL")
                    .resizable()
                    .aspectRatio(
                        contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.936,
                        height: UIScreen.main.bounds.height * 0.05)
                    
            }.buttonStyle(
                PlainButtonStyle())
                .position(
                    x: UIScreen.main.bounds.width / 2,
                    y: UIScreen.main.bounds.height * 0.7)
        }
            
            Button(action: {
                print(self.luggageArrayCheckedIn)
//                print(self.luggageArrayCheckedIn)
//                print("check is carryon \(self.isCarryOn) check is checkin \(self.isCheckedIn)")
                
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

struct SelectLuggagePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectLuggagePage(
            ctr: 0,
            isCarryOn: true,
            isCheckedIn : true,
            luggageArrayCheckedIn: luggageArray,
//            luggageArrayCarryOn : luggageArray,
            trip: tripTestData)
    }
}

struct LuggageCard: View {
    @Binding var isCarryOn : Bool
    @Binding var isCheckedIn : Bool
    @Binding var ctr : Int
    var body: some View {
    HStack {
        Button(action: {
            self.isCarryOn.toggle()
            if self.isCarryOn == true {
            self.ctr -= 1
            }
            else
            {
                self.ctr += 1
            }
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
            if self.isCheckedIn == true
            {
                self.ctr -= 1
            }
            else
            {
                self.ctr += 1
            }
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
    


