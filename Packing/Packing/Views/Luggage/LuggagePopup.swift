//
//  LuggagePopup.swift
//  Packing
//
//  Created by Andimas Bagaswara on 03/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggagePopup: View {
    private static let poppinsSemiBold16: Font = Font.custom("Poppins-SemiBold", size: 16)
    private static let poppinsRegular14: Font = Font.custom("Poppins-Regular", size: 14)
    
    private static let black: Color = Color.init(UIColor(hex: 0x070707))
    private static let grey: Color = Color.init(UIColor(hex: 0x666666))
    private static let purple: Color = Color.init(UIColor(hex: 0x654CFF))
    
    @Binding var isWarningPresented: Bool
    
    var body: some View {
        ZStack {
            BlurView(effect: .dark)
                .onTapGesture {
                    self.isWarningPresented.toggle()
            }
            Rectangle()
                .foregroundColor(Color(UIColor.init(hex: 0xFFFFFF)))
                .frame(width: UIScreen.main.bounds.width * 0.83, height: UIScreen.main.bounds.height * 0.39)
                .cornerRadius(22)
                .padding(.vertical, 5)
                .overlay(
                    ZStack {
                        GeometryReader { (proxy: GeometryProxy) in
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.03)
                                .foregroundColor(.clear)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .font(.system(size: 18))
                                        .font(Font.title.weight(.regular))
                                        .foregroundColor(LuggagePopup.black)
                                        .onTapGesture {
                                            self.isWarningPresented.toggle()
                                    }
                            ).frame(width: proxy.size.width - 43, height:proxy.size.height - 37, alignment: .topTrailing)
                        }
                        VStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.23, height: UIScreen.main.bounds.height * 0.11)
                                .overlay(
                                    Image("portable-charger")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                            )
                                .padding(.bottom, 17)
                            Text("Power banks allowed for carry-on baggage must have the capacity equivalent or less than 27,000 mAh")
                                .foregroundColor(LuggagePopup.grey)
                                .font(LuggagePopup.poppinsRegular14)
                                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.1)
                                .multilineTextAlignment(.center)
                            Spacer()
                            Divider()
                            NavigationLink(destination: RestrictionView()) {
                                Text("View Restricted Items")
                                    .foregroundColor(LuggagePopup.purple)
                                    .font(LuggagePopup.poppinsSemiBold16)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.top, 13.5)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.72, height: UIScreen.main.bounds.height * 0.3)
                    }
            )
        }
    }
}

#if DEBUG
//struct LuggagePopup_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LuggagePopup(trip: tripTestData, isWarningPresented: <#Binding<Bool>#>)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("iPhone 8")
//
//            LuggagePopup(trip: tripTestData, isWarningPresented: <#Binding<Bool>#>)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif

