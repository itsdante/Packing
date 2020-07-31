//
//  LuggageView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageView: View {
    var trip: Trip
    
    @State private var selected = 0
    
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
                ScrollView {
                    ForEach(trip.luggages) { luggage in
                        ItemList(luggage: luggage)
                    }
                }
            }
            
        }
        .navigationBarTitle("My Luggage", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: homeButton)
        .navigationBarItems(trailing: editButton)
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
#endif
