//
//  ContentView.swift
//  HomepageNewUser
//
//  Created by Laurentius Richard Reynaldo on 17/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct InputBookingNumberPage: View {
    
    
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("Add New Trip")
                
                .font(.system(size: 24, weight: .bold))
                
                .frame(width: UIScreen.main.bounds.width * 0.81, height: UIScreen.main.bounds.height * 0.03, alignment: .leading)
                
            middleRectangle()
//            Button(action: {print("asdadas")}) {
//                Image("ButtonL")
//                    .renderingMode(.original)
//                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.28)
//            }
            NextButton()
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.28)
            
        }
        
        
    }
}

struct InputBookingNumberPage_Previews: PreviewProvider {
    static var previews: some View {
        InputBookingNumberPage()
    }
}

struct middleRectangle: View {
    @State var bookingCode: String = ""
    var body: some View {
        
        ZStack{
            Image("cloud Add New Trip")
                .resizable()
                .cornerRadius(25)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.824, height: UIScreen.main.bounds.height * 0.31)
                //                    .offset(x: 0, y: -70)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.14)
                .shadow(radius: 25)
            
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width * 0.824, height: UIScreen.main.bounds.height * 0.31)
                //                    .offset(x: 0, y: 125)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.34)
                .shadow(radius: 25)
                .overlay(Text("Start your new packing list")
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.26))
            
            
            VStack(alignment: .center) {
                
                
                Text("Input your booking number")
                    .fontWeight(.regular)
                    .font(.custom("SF Pro Display", size: 12))
                
                
                
                TextField("Booking Code", text: $bookingCode)
                    .padding(.leading)
                    .font(.system(size: 12, weight: .bold))
                    .frame(width: 280, height: 26,   alignment: .center)
                    .background(Color(red: 0.847, green: 0.847, blue: 0.847))
                    .cornerRadius(10)
                
            }.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.33)
        }
    }
}
