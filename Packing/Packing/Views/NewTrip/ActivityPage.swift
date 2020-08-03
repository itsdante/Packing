//
//  ContentView.swift
//  MC3ActivitiesProduct
//
//  Created by Laurentius Richard Reynaldo on 24/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

let activities : [String] = ["beach","hike","formal events","winter sport","swimming","gym","photography","business","party"]

struct ActivityPage: View {
    var gender:String
    var trip: Trip
    @State var newLuggageArray : [Luggage]
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading, spacing: 3){
                Text("Activities")
                    .font(.custom("Poppins-SemiBold", size: 22))
                    .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("What Activities Will You Do")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.1)
                .position(
                    x: UIScreen.main.bounds.width * 0.33,
                    y: UIScreen.main.bounds.height * 0)
            
            VStack(spacing: 41){
                HStack(spacing: 18){
                    ForEach(0 ..< 3) { item in
                        
                        Button(action: {
                            print("\(item)")
                            print("\(self.gender)")
                            
                        }) {
                            ActivityCard(
                                num: item,
                                name: activities[item],
                                gender: self.gender,
                                isSelected: false,
                                newLuggage: luggage1,
                                newLuggageArray: self.$newLuggageArray)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                HStack(spacing: 18){
                    ForEach(3 ..< 6) { item in
                        
                        Button(action: {print("\(item)")}) {
                            
                            ActivityCard(num: item,
                                         name: activities[item],
                                         gender: self.gender,
                                         isSelected: false,
                                         newLuggage: luggage1,
                                         newLuggageArray: self.$newLuggageArray)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                HStack(spacing: 18){
                    ForEach(6 ..< 9) { item in
                        Button(action: {print("\(item)")}) {
                            
                            ActivityCard(num: item,
                                         name: activities[item],
                                         gender: self.gender,
                                         isSelected: false,
                                         newLuggage: luggage1,
                                         newLuggageArray: self.$newLuggageArray)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.position(
                x: UIScreen.main.bounds.width / 2,
                y: UIScreen.main.bounds.height * 0.34)
            
            NavigationLink(destination: SelectLuggagePage(
                ctr: 0,
                isCarryOn: false,
                isCheckedIn: false,
                luggageArrayCheckedIn: newLuggageArray,
//                luggageArrayCarryOn: newLuggageArray,
                trip: trip))
            {
                Image("ButtonL")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.936,
                        height: UIScreen.main.bounds.height * 0.05)
            }.buttonStyle(PlainButtonStyle())
                .position(
                    x: UIScreen.main.bounds.width / 2,
                    y: UIScreen.main.bounds.height * 0.7)
            
            
            
        }
        
    }
}


struct ActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ActivityPage(gender: "Male", trip: tripTestData, newLuggageArray: [])
        }
    }
}

var pickedActivity :[Int] = []



struct ActivityCard: View {
    var num : Int
    var name : String
    var gender : String
    @State var isSelected : Bool
    @State var newLuggage : Luggage
    @Binding var newLuggageArray : [Luggage]
    var body: some View {
        
        
        ZStack{
            
            
            if isSelected == true {
                
                
                Image("\(name) Selected")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.27,
                        height: UIScreen.main.bounds.height * 0.14)
                
                
            }
            else
            {
                Rectangle()
                    .frame(
                        width: UIScreen.main.bounds.width * 0.27,
                        height: UIScreen.main.bounds.height * 0.14)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    //                .shadow(radius: 10)
                    .shadow(color: .init(UIColor(
                        red: 0.396,
                        green: 0.298,
                        blue: 1,
                        alpha: 0.1)),
                            radius: 21,
                            x: 0,
                            y: 6)
                Image("\(name)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.27,
                        height: UIScreen.main.bounds.height * 0.14)
                
            }
        }.onTapGesture {
            self.isSelected.toggle()
            if self.isSelected == true {
                print("TRUE \(self.num)")
                pickedActivity.append(self.num)
                switch self.num {
                case 0:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.beach,
                        isCheckedIn: false,
                        gender: self.gender
                        )
                case 1:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.hike,
                        isCheckedIn: false,
                        gender: self.gender)
                case 2:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.formal,
                        isCheckedIn: false,
                        gender: self.gender)
                case 3:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.winter,
                        isCheckedIn: false,
                        gender: self.gender)
                case 4:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.swimming,
                        isCheckedIn: false,
                        gender: self.gender)
                case 5:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.gym,
                        isCheckedIn: false,
                        gender: self.gender)
                case 6:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.photography,
                        isCheckedIn: false,
                        gender: self.gender)
                case 7:
                    self.newLuggage = Luggage(
                        id: activities[self.num],
                        category: Luggage.Category.business,
                        isCheckedIn: false,
                        gender: self.gender)
                default:
                    self.newLuggage = Luggage(
                    id: activities[self.num],
                    category: Luggage.Category.party,
                    isCheckedIn: false,
                    gender: self.gender)
                }
                
                self.newLuggageArray.append(self.newLuggage)
            }
            else
            {
                print("False \(self.name)")
                let index = pickedActivity.firstIndex(of: self.num)
                pickedActivity.remove(at: index!)
                let newLuggageIndex = self.newLuggageArray.firstIndex{
                    $0.id == activities[self.num]
                }
                self.newLuggageArray.remove(at: newLuggageIndex!)
                print(newLuggageIndex!)
                
            }
            
        }
    }
}

