//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectLuggagePage: View {
    var body: some View {
        NavigationView{
        ZStack{
            VStack(alignment: .leading, spacing: 6){
                Text("Luggage")
                    .font(.custom("Poppins-SemiBold", size: 22))
                Text("What Kind of Luggage Will You Bring?")
                    .font(.custom("SF Pro Display", size: 14))
                    .fontWeight(.regular)
                }
            .position(x: UIScreen.main.bounds.width * 0.38, y: UIScreen.main.bounds.height * 0.04)
            LuggageCard()
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            
            NextButton()
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
        }
    }
    }
}

struct SelectLuggagePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectLuggagePage()
    }
}

struct LuggageCard: View {
    var body: some View {
        HStack {
            Button(action: {
                print("asdadsdsadasda1")
            }){
                Image("CarryOn")
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
            }
            
            
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)
            Button(action: {
                print("asdadsdsadasda1")
            }){
                Image("CheckIn")
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                
                
            }
        }
    }
}

struct NextButton: View {
    var body: some View {
        Button(action: {
            print("asdadasdd")
        }) {
            Image("ButtonL")
                .renderingMode(.original)
                .frame(width: UIScreen.main.bounds.width * 0.76, height: UIScreen.main.bounds.height * 0.045)
        }
    }
}
