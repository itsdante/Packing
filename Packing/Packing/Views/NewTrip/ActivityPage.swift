//
//  ContentView.swift
//  MC3ActivitiesProduct
//
//  Created by Laurentius Richard Reynaldo on 24/07/20.
//  Copyright © 2020 Laurentius Richard Reynaldo. All rights reserved.
//

import SwiftUI

struct ActivityPage: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var appState: AppState
    @State var selectedActivity: [String] = []
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private static var bgColor: Color = Color.init(UIColor.init(hex: 0xF7F8FC))
    
    var selectedGender: String
    var selectedLuggage: [Int]
    var trip: Trip
    
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
                HStack(spacing: 18) {
                    ForEach(0 ..< 3) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender)
                    }
                }
                HStack(spacing: 18) {
                    ForEach(3 ..< 6) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender)
                    }
                }
                HStack(spacing: 18) {
                    ForEach(6 ..< 9) { item in
                        ActivityCard(selectedActivity: self.$selectedActivity, optionIndex: item, selectedGender: self.selectedGender)
                    }
                }
            }.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.34)
            Button(action: {
                self.finalTouch()
                self.appState.moveToRoot = true
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(UIColor.init(hex: 0x654CFF)))
                    .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.058)
                    .shadow(color: Color(UIColor.init(hex: 0x2704FE, alpha: 0.4)), radius: 5, y: 2)
                    .overlay(
                        Text("Next")
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
        }
        .padding(.top, 35)
        .navigationBarTitle("New Trip")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
        })
        .background(Color.init(UIColor.init(hex: 0xF7F8FC)).edgesIgnoringSafeArea(.all))
    }
    
    func finalTouch() {
        let newTrip = TripModel(context: self.moc)
        newTrip.id = UUID()
        newTrip.bookingNumber = trip.bookingNumber
        newTrip.airline = trip.airline
        newTrip.flightNumber = trip.flightNumber
        newTrip.originAirportCode = trip.originAirportCode
        newTrip.originAirport = trip.originAirport
        newTrip.originCity = trip.originCity
        newTrip.originCountry = trip.originCountry
        newTrip.destinationAirportCode = trip.destinationAirportCode
        newTrip.destinationAirport = trip.destinationAirport
        newTrip.destinationCity = trip.destinationCity
        newTrip.destinationCountry = trip.destinationCountry
        newTrip.departureDate = trip.departureDate
        newTrip.arrivalDate = trip.arrivalDate
        newTrip.createdAt = trip.createdAt
        
        let essentialsLuggage = LuggageModel(context: self.moc)
        essentialsLuggage.id = UUID()
        essentialsLuggage.category = "Essentials"
        essentialsLuggage.isCheckedIn = self.selectedLuggage.contains(1) ? false : true
        essentialsLuggage.order = 1
        essentialsLuggage.gender = self.selectedGender
        for item in predefinedItem(gender: self.selectedGender, category: "Essentials", isCheckedIn: self.selectedLuggage.contains(1) ? false : true) {
            let newItem = ItemModel(context: self.moc)
            newItem.id = UUID()
            newItem.name = item
            newItem.quantity = 1
            newItem.isRestricted = false
            newItem.isCompleted = false
            newItem.createdAt = Date()
            essentialsLuggage.addToItemModel(newItem)
        }
        newTrip.addToLuggageModel(essentialsLuggage)
        
        let clothingLuggage = LuggageModel(context: self.moc)
        clothingLuggage.id = UUID()
        clothingLuggage.category = "Clothing"
        clothingLuggage.isCheckedIn = self.selectedLuggage.contains(1) ? false : true
        clothingLuggage.order = 2
        clothingLuggage.gender = self.selectedGender
        for item in predefinedItem(gender: self.selectedGender, category: "Clothing", isCheckedIn: self.selectedLuggage.contains(1) ? false : true) {
            let newItem = ItemModel(context: self.moc)
            newItem.id = UUID()
            newItem.name = item
            newItem.quantity = 1
            newItem.isRestricted = false
            newItem.isCompleted = false
            newItem.createdAt = Date()
            clothingLuggage.addToItemModel(newItem)
        }
        newTrip.addToLuggageModel(clothingLuggage)
        
        let toiletriesLuggage = LuggageModel(context: self.moc)
        toiletriesLuggage.id = UUID()
        toiletriesLuggage.category = "Toiletries"
        toiletriesLuggage.isCheckedIn = self.selectedLuggage.contains(1) ? false : true
        toiletriesLuggage.order = 3
        toiletriesLuggage.gender = self.selectedGender
        for item in predefinedItem(gender: self.selectedGender, category: "Toiletries", isCheckedIn: self.selectedLuggage.contains(1) ? false : true) {
            let newItem = ItemModel(context: self.moc)
            newItem.id = UUID()
            newItem.name = item
            newItem.quantity = 1
            newItem.isRestricted = false
            newItem.isCompleted = false
            newItem.createdAt = Date()
            toiletriesLuggage.addToItemModel(newItem)
        }
        newTrip.addToLuggageModel(toiletriesLuggage)
        
        if self.selectedGender != "Male" && self.selectedLuggage.count > 1 {
            let femaleClothing = LuggageModel(context: self.moc)
            femaleClothing.id = UUID()
            femaleClothing.category = "Clothing"
            femaleClothing.isCheckedIn = self.selectedLuggage.contains(2) ? true : false
            femaleClothing.order = 2
            femaleClothing.gender = self.selectedGender
            for item in predefinedItem(gender: self.selectedGender, category: "Clothing", isCheckedIn: self.selectedLuggage.contains(2) ? true : false) {
                let newItem = ItemModel(context: self.moc)
                newItem.id = UUID()
                newItem.name = item
                newItem.quantity = 1
                newItem.isRestricted = false
                newItem.isCompleted = false
                newItem.createdAt = Date()
                femaleClothing.addToItemModel(newItem)
            }
            newTrip.addToLuggageModel(femaleClothing)
            
            let femaleToiletries = LuggageModel(context: self.moc)
            femaleToiletries.id = UUID()
            femaleToiletries.category = "Toiletries"
            femaleToiletries.isCheckedIn = self.selectedLuggage.contains(2) ? true : false
            femaleToiletries.order = 3
            femaleToiletries.gender = self.selectedGender
            for item in predefinedItem(gender: self.selectedGender, category: "Toiletries", isCheckedIn: self.selectedLuggage.contains(2) ? true : false) {
                let newItem = ItemModel(context: self.moc)
                newItem.id = UUID()
                newItem.name = item
                newItem.quantity = 1
                newItem.isRestricted = false
                newItem.isCompleted = false
                newItem.createdAt = Date()
                femaleToiletries.addToItemModel(newItem)
            }
            newTrip.addToLuggageModel(femaleToiletries)
        }
        
        for activity in selectedActivity {
            let activityLuggage = LuggageModel(context: self.moc)
            activityLuggage.id = UUID()
            activityLuggage.category = activity
            activityLuggage.isCheckedIn = self.selectedLuggage.contains(2) ? true : false
            activityLuggage.order = 4
            activityLuggage.gender = self.selectedGender
            for item in predefinedItem(gender: self.selectedGender, category: activity, isCheckedIn: self.selectedLuggage.contains(2) ? true : false) {
                let newItem = ItemModel(context: self.moc)
                newItem.id = UUID()
                newItem.name = item
                newItem.quantity = 1
                newItem.isRestricted = false
                newItem.isCompleted = false
                newItem.createdAt = Date()
                activityLuggage.addToItemModel(newItem)
            }
            newTrip.addToLuggageModel(activityLuggage)
        }
        
        try? self.moc.save()
    }
}

#if DEBUG
//struct ActivityPage_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ActivityPage(selectedGender: "Male", selectedLuggage: [1,2], trip: tripTestData)
//        }
//        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        .previewDisplayName("iPhone 11")
//    }
//}
#endif
