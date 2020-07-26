//
//  ContentView.swift
//  MC3ActivitiesProduct
//
//  Created by Laurentius Richard Reynaldo on 24/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

let activities : [String] = ["beach","hike","formal events","winter sport","swimming","gym","photography","business","party/festivals"]

struct ActivityPage: View {
    var body: some View {
            NavigationView{
            ZStack{
                VStack(alignment: .leading, spacing: 3){
                    Text("Activities")
                        .font(.custom("Poppins", size: 22))
                    Text("What Activities Will You Do")
                }.position(x: 125, y: 10)
                VStack(spacing: 41){
                    HStack(spacing: 18){
                        ForEach(0 ..< 3) { item in
                            
                            Button(action: {print("\(item)")}) {
                                ActivityCard(num: item)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    HStack(spacing: 18){
                        ForEach(3 ..< 6) { item in
                            
                           Button(action: {print("\(item)")}) {
                                
                                ActivityCard(num: item)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    HStack(spacing: 18){
                        ForEach(6 ..< 9) { item in
                            Button(action: {print("\(item)")}) {
                                
                                ActivityCard(num: item)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.35)
                
                NavigationLink(destination: SelectGenderPage())
                {
                    Image("ButtonL")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.05)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.75)
                }.buttonStyle(PlainButtonStyle())
                
            }
        }
        }
    }

struct ActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPage()
    }
}



struct ActivityCard: View {
    
    var num = 0
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 102, height: 115)
                .foregroundColor(.white)
                .cornerRadius(20)
                //                .shadow(radius: 10)
                .shadow(color: .init(UIColor(red: 0.396, green: 0.298, blue: 1, alpha: 0.08)), radius: 21, x: 0, y: 6)
            
            VStack(spacing: 7){
                Image("\(activities[num])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.12, height: UIScreen.main.bounds.height * 0.07)
                Text("\(activities[num].capitalized)")
            }
        }
    }
}
