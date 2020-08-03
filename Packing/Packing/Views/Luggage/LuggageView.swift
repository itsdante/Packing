//
//  LuggageView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageView: View {
    @State private var selected = 0
    
    var trip: Trip
    
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
        NavigationLink(destination: RestrictionView(trip: trip)) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25, height: 21)
                .overlay(
                    Image("edit-button")
            )
        }
    }
    
    var body: some View {
        VStack {
            CustomSegmentedPickerView(selected: $selected)
                .padding(.top, 20)
            Spacer()
            if selected == 0 {
                if trip.luggages.filter({ $0.isCheckedIn == false }).count != 0 {
                    ScrollView {
                        ForEach(trip.luggages.filter({ $0.isCarryOn == true })) { luggage in
                            LuggageListCard(luggage: luggage)
                        }
                    }
                }  else {
                    EmptyStateView(isCheckedIn: false)
                }
            } else {
                if trip.luggages.filter({ $0.isCheckedIn == true }).count != 0 {
                    ScrollView {
                        ForEach(trip.luggages.filter({ $0.isCheckedIn == true })) { luggage in
                            LuggageListCard(luggage: luggage)
                        }
                    }
                }  else {
                    EmptyStateView(isCheckedIn: true)
                }
            }
            
        }
        .navigationBarTitle("My Luggage", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: homeButton, trailing: editButton)
    }
}

struct EmptyStateView: View {
    private static let poppinsSemiBold16: Font = Font.custom("Poppins-SemiBold", size: 16)
    private static let poppinsMedium14: Font = Font.custom("Poppins-Medium", size: 14)
    
    private static let purple: Color = Color.init(UIColor.init(hex: 0x4C37C9))
    private static let grey: Color = Color.init(UIColor.init(hex: 0x979797))
    
    var isCheckedIn: Bool
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .edgesIgnoringSafeArea(.bottom)
            .overlay(
                VStack(alignment: .center) {
                    Image("luggage-empty-state-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.61, height: UIScreen.main.bounds.height * 0.24)
                    Text(isCheckedIn ? "Uh-oh! You’re not bringing a checked in luggage" : "Uh-oh! You’re not bringing a carry on luggage")
                        .font(EmptyStateView.poppinsSemiBold16)
                        .foregroundColor(EmptyStateView.purple)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Text(isCheckedIn ? "Tap the edit button to add a checked in luggage" : "Tap the edit button to add a carry on luggage")
                        .font(EmptyStateView.poppinsMedium14)
                        .foregroundColor(EmptyStateView.grey)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 64)
        )
    }
}

struct MenuButton: View {
    @State var expand = false
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 18) {
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 25, height: 21)
                    .overlay(
                        Image("edit-button")
                )
                //                Text("Expand").hidden()
                //                Image(systemName: expand ? "chevron.down" : "chevron.up")
                //                    .resizable()
                //                    .frame(width: 13, height: 6)
            }.onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                Button(action: {
                    
                }) {
                    Text("View Restricted Items")
                        .modifier(EditButtonModifier())
                }
                Button(action: {
                    
                }) {
                    Text("Edit Activities")
                        .modifier(EditButtonModifier())
                }
                Button(action: {
                    
                }) {
                    Text("Edit Luggage")
                        .modifier(EditButtonModifier())
                }
                Button(action: {
                    
                }) {
                    Text("Sort List")
                        .modifier(EditButtonModifier())
                }
                Button(action: {
                    
                }) {
                    Text("Uncheck All")
                        .modifier(EditButtonModifier())
                }
            }
        }
        .padding()
        .background(Color.init(.white)
        .shadow(color: Color.init(UIColor.init(hex: 0x636363)), radius: 20, y: 2))
        .cornerRadius(11)
        .animation(.spring())
    }
}

struct EditButtonModifier: ViewModifier {
    private static let ButtonFont: Font = Font.custom("Poppins-SemiBold", size: 11)
    private static let ButtonColor: Color = Color.init(UIColor(hex: 0x666666))
    
    func body(content: Content) -> some View {
        content
            .font(EditButtonModifier.ButtonFont)
            .foregroundColor(EditButtonModifier.ButtonColor)
    }
}

#if DEBUG
//struct LuggageView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LuggageView(trip: tripTestData, isNavigationBarHidden: <#Binding<Bool>#>)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("iPhone 8")
//
//            LuggageView(trip: tripTestData, isNavigationBarHidden: <#Binding<Bool>#>)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif

struct LuggageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LuggageView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            LuggageView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
