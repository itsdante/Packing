//
//  LuggageMenuCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageMenuCard: View {
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

struct LuggageMenuCard_Previews: PreviewProvider {
    static var previews: some View {
        LuggageMenuCard()
    }
}
