//
//  LuggageEmptyState.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageEmptyState: View {
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
                        .font(LuggageEmptyState.poppinsSemiBold16)
                        .foregroundColor(LuggageEmptyState.purple)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Text(isCheckedIn ? "Tap the edit button to add a checked in luggage" : "Tap the edit button to add a carry on luggage")
                        .font(LuggageEmptyState.poppinsMedium14)
                        .foregroundColor(LuggageEmptyState.grey)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 64)
        )
    }
}

#if DEBUG
struct LuggageEmptyState_Previews: PreviewProvider {
    static var previews: some View {
        LuggageEmptyState(isCheckedIn: true)
    }
}
#endif
