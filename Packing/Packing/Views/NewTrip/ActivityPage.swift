//
//  ContentView.swift
//  MC3ActivitiesProduct
//
//  Created by Laurentius Richard Reynaldo on 24/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct ActivityPage: View {
    
    @State var a: Int = 1
    @State var imageData:String = ""
    @State var selectedActivity: [Luggage] = []
    @State var activitiesData : [Activity] = [
        .init(id: 1, imageUrl: "https://topgrowth.sgp1.digitaloceanspaces.com/Hike%20Default.png", selectUrlImage: "SteveJobs"),
        .init(id: 2, imageUrl: "https://topgrowth.sgp1.digitaloceanspaces.com/Hike%20Default.png", selectUrlImage: "Satya Nadella"),
        .init(id: 3, imageUrl: "https://topgrowth.sgp1.digitaloceanspaces.com/Hike%20Default.png", selectUrlImage: "Jeff Bezos")
    ]
    
    let activities : [String] = ["beach", "hike", "formal", "winter", "swimming", "gym", "photography", "business", "party"]
    
    var selectedGender: String
    var selectedLuggage: [Int]
    @State var trip: Trip

    func loadData(){
        guard let url = URL(string:"http://128.199.215.67:3000/api/v1/activities/allActivities/female") else {
            print("invalid")
            return
        }
        let request = URLRequest(url:url)
        URLSession.shared.dataTask(with:request) {
            data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ActivitiesModel.self, from:data){
                    DispatchQueue.main.async {
                        self.activitiesData = decodedResponse.data
                    }
                }
            }
        }.resume()
    }
    func newView(id:Int, new:Int) -> ActivityCard {
        let b = id*new
        print(b)
        let c = (self.activitiesData.count <= b ? "https://topgrowth.sgp1.digitaloceanspaces.com/Hike%20Default.png" : self.activitiesData[b].imageUrl )
        return ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: b, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage, imageUrl:c)
    }
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Activities")
                    .font(.custom("Poppins-SemiBold", size: 22))
                    .foregroundColor(.init(UIColor(red: 0.306, green: 0.302, blue: 0.302, alpha: 1)))
                Text("What Activities Will You Do")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.init(UIColor(red: 0.577, green: 0.535, blue: 0.833, alpha: 1)))
            }
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 0.1)
            .position(x: UIScreen.main.bounds.width * 0.33, y: UIScreen.main.bounds.height * 0)
            
            VStack(spacing: 41) {
                ForEach(1 ..< 4){
                    items in
                        HStack(spacing: 18) {
                            ForEach(1 ..< 4){
                                item in
                                self.newView(id:items, new:item)
                            }
                        }
                    
                }
                
//
//                HStack(spacing: 18) {
//                    ForEach(3 ..< 6) { item in
//
//                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage)
//
//                    }
//                }
//
//                HStack(spacing: 18) {
//                    ForEach(6 ..< 9) { item in
//
//                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender, selectedLuggage: self.selectedLuggage)
//
//                    }
//                }
            }.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.34)
            
            
            NavigationLink(destination: LuggageView(trip: trip)) {
                Image("ButtonL")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.05)
            }
            .buttonStyle(PlainButtonStyle())
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
            .simultaneousGesture(TapGesture().onEnded{
                self.selectedActivity.append(Luggage(category: .esssentials, isCheckedIn: self.selectedLuggage.contains(1) ? false : true, gender: self.selectedGender))
                self.selectedActivity.append(Luggage(category: .toiletries, isCheckedIn: self.selectedLuggage.contains(1) ? false : true, gender: self.selectedGender))
                self.trip.luggages = self.selectedActivity
            })
        }.onAppear(perform: loadData)
    }
}


struct CardContainer:View {
    let itemId:Int
    let itemNext:Int
    var currActivity: [Activity]
    @Binding var selActivity: [Luggage]
    var selGender: String
    var selLuggage: [Int]
    
    var body: some View {
        ActivityCard(selectedActivity: self.$selActivity, optionIndex: self.currActivity[itemNext].id, selectedGender: self.selGender, selectedLuggage: self.selLuggage, imageUrl:self.currActivity[itemNext].imageUrl)
    }
}

struct ActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ActivityPage(selectedGender: "Male", selectedLuggage: [1,2], trip: tripTestData)
        }
    }
}
