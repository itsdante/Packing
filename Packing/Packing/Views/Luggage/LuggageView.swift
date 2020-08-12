//
//  LuggageView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageView: View {
    init(uuid: UUID) {
        self._luggageCarryOnResults = FetchRequest(entity: LuggageModel.entity(), sortDescriptors: [], predicate: NSPredicate(format: "tripModel.id == %@ && isCheckedIn == false", uuid as CVarArg))
        self._luggageCheckInResults = FetchRequest(entity: LuggageModel.entity(), sortDescriptors: [], predicate: NSPredicate(format: "tripModel.id == %@ && isCheckedIn == true", uuid as CVarArg))
        self.uuid = uuid
    }
    
    @EnvironmentObject var appState: AppState
    @State private var selected = 0
    @State var isWarningPresented: Bool = false
    @State var isMenuPresented: Bool = false
    var uuid: UUID
    
    @FetchRequest var luggageCarryOnResults: FetchedResults<LuggageModel>
    @FetchRequest var luggageCheckInResults: FetchedResults<LuggageModel>
    
    private var homeButton: some View {
        Button(action: {
            
        }) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25, height: 21)
                .overlay(
                    Image("home-button")
            )
        }
    }
    
    private var editButton: some View {
        Button(action: {
            self.isMenuPresented.toggle()
        }) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25, height: 21)
                .overlay(
                    Image("edit-button")
            )
        }
        .onAppear {
            self.isMenuPresented = false
            self.appState.isNavigationBarHidden = false
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                CustomSegmentedPickerView(selected: $selected)
                    .padding(.top, 20)
                Spacer()
                if selected == 0 {
                    if luggageCarryOnResults.count != 0 {
                        ScrollView {
                            ForEach(luggageCarryOnResults, id: \.self) { (luggage: LuggageModel) in
                                LuggageListCard(luggage: luggage, isWarningPresented: self.$isWarningPresented)
                            }
                        }
                    }  else {
                        LuggageEmptyState(isCheckedIn: false)
                    }
                } else {
                    if luggageCheckInResults.count != 0 {
                        ScrollView {
                            ForEach(luggageCheckInResults, id: \.self) { (luggage: LuggageModel) in
                                LuggageListCard(luggage: luggage, isWarningPresented:  self.$isWarningPresented)
                            }
                        }
                    }  else {
                        LuggageEmptyState(isCheckedIn: true)
                    }
                }
            }
            if isMenuPresented {
                LuggageMenuCard(uuid: self.uuid, isMenuPresented: self.$isMenuPresented)
            }
            if isWarningPresented {
                LuggagePopup(isWarningPresented: self.$isWarningPresented)
            }
        }
        .navigationBarTitle("My Luggage", displayMode: .inline)
        .navigationBarItems(trailing: editButton)
        .onAppear {
            self.appState.isNavigationBarHidden = false
        }
    }
}

#if DEBUG
//struct LuggageView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NavigationView {
//                LuggageView(trip: tripTestData)
//                    .environmentObject(AppState())
//            }
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .previewDisplayName("iPhone 8")
//            
//            NavigationView {
//                LuggageView(trip: tripTestData)
//                    .environmentObject(AppState())
//            }
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif
