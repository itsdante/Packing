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
    private static let symbolWidth: CGFloat = 20
    private static let symbolHeight: CGFloat = 20
    private static let completedColor: Color = Color(UIColor.init(hex: 0x654CFF))
    private static let emptyColor: Color = Color(.secondaryLabel)
    
    private static let itemFont: Font = Font.custom("Poppins-Regular", size: 15)
    private static let itemColor: Color = Color(UIColor.init(hex: 0x555B6E))
    
    var item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? ItemCell.completedSymbol : ItemCell.emptySymbol)
                .resizable()
                .frame(width: ItemCell.symbolWidth, height: ItemCell.symbolHeight)
                .foregroundColor(item.isCompleted ? ItemCell.completedColor : ItemCell.emptyColor)
                .onTapGesture {
                    
            }
            Text(item.name)
                .font(ItemCell.itemFont)
                .foregroundColor(ItemCell.itemColor)
                .strikethrough(item.isCompleted)
        }.padding(.vertical, 5)
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(name: "Passport", quantity: 1, isCompleted: false, createdAt: Date())
        return ItemCell(item: item)
    }
}
