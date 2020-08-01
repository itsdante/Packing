//
//  CustomSegmentedPicker.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct CustomSegmentedPickerView: View {
    private static let SelectedSegmentColor: Color = Color(UIColor.init(hex: 0x654CFF))
    private static let SegmentColor: Color = Color.clear
    private static let SelectedTextColor: Color = Color(.white)
    private static let TextColor: Color = Color(.secondaryLabel)
    
    let type: [String] = ["Carry On", "Check In"]
    @Binding var selected : Int
    
    var body : some View{
        HStack{
            ForEach(type.indices) { index in
                Button(action: {
                    self.selected = index
                }) {
                    Text(self.type[index])
                        .modifier(PickerTextModifier())
                        .background(self.selected == index ? CustomSegmentedPickerView.SelectedSegmentColor : CustomSegmentedPickerView.SegmentColor)
                        .clipShape(Capsule())
                }
                .foregroundColor(self.selected == index ? CustomSegmentedPickerView.SelectedTextColor : CustomSegmentedPickerView.TextColor)
            }
            
        }.modifier(SegmentedPickerModifier())
    }
}

struct PickerTextModifier: ViewModifier {
    private static let PickerXPadding: CGFloat = 45
    private static let PickerYPadding: CGFloat = 14
    private static let PickerFont: Font = Font.custom("Poppins-SemiBold", size: 11)
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, PickerTextModifier.PickerXPadding)
            .padding(.vertical, PickerTextModifier.PickerYPadding)
            .font(PickerTextModifier.PickerFont)
    }
}

struct SegmentedPickerModifier: ViewModifier {
    private static let primaryShadowColor: Color = Color(UIColor.init(hex: 0x222F55)).opacity(0.05)
    private static let secondaryShadowColor: Color = Color(UIColor.init(hex: 0x3A4C82)).opacity(0.07)
    private static let shadowRadius: CGFloat = 4
    private static let shadowX: CGFloat = 0
    private static let shadowY: CGFloat = 10
    
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color(.white))
            .clipShape(Capsule())
            .shadow(color: SegmentedPickerModifier.primaryShadowColor,
                    radius: SegmentedPickerModifier.shadowRadius,
                    x: SegmentedPickerModifier.shadowX,
                    y: SegmentedPickerModifier.shadowY)
            .shadow(color: SegmentedPickerModifier.secondaryShadowColor,
                    radius: SegmentedPickerModifier.shadowRadius,
                    x: SegmentedPickerModifier.shadowX,
                    y: SegmentedPickerModifier.shadowY)
            .animation(.linear)
    }
}

#if DEBUG
struct CustomeSegmentedPickerPreviewView: View {
    @State var selected = 0
    
    var body: some View {
        CustomSegmentedPickerView(selected: self.$selected).padding()
    }
}

struct CustomSegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomeSegmentedPickerPreviewView().previewLayout(.sizeThatFits)
    }
}
#endif
