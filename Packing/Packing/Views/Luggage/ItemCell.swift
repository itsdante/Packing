//
//  ItemCell.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct ItemCell: View {
    private static let completedSymbol: String = "checkmark.circle.fill"
    private static let emptySymbol: String = "circle"
    private static let completedColor: Color = Color(UIColor.init(hex: 0x654CFF))
    private static let emptyColor: Color = Color(.secondaryLabel)
    
    private static let itemFont: Font = Font.custom("Poppins-Regular", size: 15)
    private static let itemColor: Color = Color(UIColor.init(hex: 0x555B6E))
    
    @State var item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? ItemCell.completedSymbol : ItemCell.emptySymbol)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(item.isCompleted ? ItemCell.completedColor : ItemCell.emptyColor)
                .onTapGesture {
                    self.item.isCompleted.toggle()
            }
            Text(item.name)
                .font(ItemCell.itemFont)
                .foregroundColor(ItemCell.itemColor)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#if DEBUG
struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        return ItemCell(item: item1).previewLayout(.sizeThatFits)
    }
}
#endif
