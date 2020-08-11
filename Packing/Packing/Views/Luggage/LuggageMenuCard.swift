//
//  LuggageMenuCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageMenuCard: View {
    private static var shadowColor: Color = Color.init(UIColor.init(hex: 0x636363, alpha: 0.2))
    
    @Binding var isMenuPresented: Bool
    
//    var trip: Trip
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.clear)
                .onTapGesture {
                    self.isMenuPresented.toggle()
            }
            if isMenuPresented {
                GeometryReader { (proxy: GeometryProxy) in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: RestrictionView()) {
                            Text("View Restricted Items")
                                .modifier(EditButtonModifier())
                        }
                        Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        Button(action: {
                            
                        }) {
                            Text("Edit Activities")
                                .modifier(EditButtonModifier())
                        }
                        Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        Button(action: {
                            
                        }) {
                            Text("Edit Luggage")
                                .modifier(EditButtonModifier())
                        }
                        Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        Button(action: {
                            
                        }) {
                            Text("Sort List")
                                .modifier(EditButtonModifier())
                        }
                        Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        Button(action: {
                            
                        }) {
                            Text("Uncheck All")
                                .modifier(EditButtonModifier())
                        }
                    }
                    .padding()
                    .background(Color.init(.white)
                    .cornerRadius(11)
                    .shadow(color: LuggageMenuCard.shadowColor, radius: 2, y: 2))
                    .animation(.spring())
                    .frame(width: proxy.size.width - 43, height:proxy.size.height, alignment: .topTrailing)
                }
            }
        }
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

//#if DEBUG
//struct LuggageMenuCard_Previews: PreviewProvider {
//    static var previews: some View {
//        LuggageMenuCard(isMenuPresented: <#Binding<Bool>#>)
//    }
//}
//#endif
