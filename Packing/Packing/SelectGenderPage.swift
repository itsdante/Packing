//
//  ContentView.swift
//  MC3GenderPage
//
//  Created by Laurentius Richard Reynaldo on 20/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct SelectGenderPage: View {
    var body: some View {
        NavigationView{
        ZStack{
            VStack(alignment: .leading){
                Text("Gender")
                    .font(.custom("Poppins-SemiBold", size: 22))
                Text("Choose Your Gender")
                    .font(.custom("SF Pro Display", size: 14))
                    .fontWeight(.regular)
            }.position(x: UIScreen.main.bounds.width * 0.22, y: UIScreen.main.bounds.height * 0.04)
            GenderCard()
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
            NavigationLink(destination: ActivityPage()){
            Image("ButtonL")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.05)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.27)
            }.buttonStyle(PlainButtonStyle())
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
            }
        }
    }
    }


struct SelectGenderPage_Previews: PreviewProvider {
    static var previews: some View {
        SelectGenderPage()
    }
}

struct GenderCard: View {
    var body: some View {
        HStack {
            Button(action: {
                print("asdadsdsadasda1")
            }){
                Image("Man")
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
            }
            
            
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)
            Button(action: {
                print("asdadsdsadasda1")
            }){
                Image("Woman")
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                
                
            }
        }
    }
}
