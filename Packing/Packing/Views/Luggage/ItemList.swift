//
//  ItemList.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    private static let sectionFont: Font = Font.custom("Poppins-SemiBold", size: 18)
    private static let sectionFontColor: Color = Color(UIColor.init(hex: 0x4E4D4D))
    private static let sectionCountFont: Font = Font.custom("Poppins-Regular", size: 14)
    private static let sectionCountColor: Color = Color(UIColor.init(hex: 0x999999))
    
    private static let dropDownImageUp: String = "chevron.up"
    private static let dropDownImageDown: String = "chevron.down"
    private static let dropDownImageFont: Font = Font.title.weight(.semibold)
    private static let dropDownImageColor: Color = Color(UIColor.init(hex: 0x353535))
    
    private static let addItemFont: Font = Font.custom("Poppins-Regular", size: 15)
    private static let addItemColor: Color = Color(UIColor.init(hex: 0x555B6E))
    
    private static let listShadowColor: Color = Color.init(UIColor.init(hex: 0x0068FD, alpha: 0.07))
    
    var luggage: Luggage
    
    @State private var isExpanded: Bool = true
    @State private var newItem = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(luggage.category)
                    .font(ItemList.sectionFont)
                    .foregroundColor(ItemList.sectionFontColor)
                Spacer()
                Text("\(luggage.items.count) items")
                    .font(ItemList.sectionCountFont)
                    .foregroundColor(ItemList.sectionCountColor)
                Image(systemName: self.isExpanded ? ItemList.dropDownImageDown : ItemList.dropDownImageUp)
                    .resizable()
                    .frame(width: 14, height: 9)
                    .font(ItemList.dropDownImageFont)
                    .foregroundColor(ItemList.dropDownImageColor)
            }
            .padding(.horizontal, 30)
            .onTapGesture {
                self.isExpanded.toggle()
            }
            if self.isExpanded{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(luggage.categoryColor))
                    List{
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(ItemList.addItemColor)
                            TextField("Add New Item", text: self.$newItem, onCommit: {
                                
                            })
                                .font(ItemList.addItemFont)
                                .foregroundColor(ItemList.addItemColor)
                        }
                        .padding(.vertical, 5)
                        ForEach(luggage.items) { item in
                            ItemCell(item: item)
                        }
                    }
                    .padding(.leading, 22)
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                    }
                }
                .frame(height: CGFloat(luggage.items.count + 1) * CGFloat(45))
                .cornerRadius(14)
                .padding(.horizontal, 7)
                .shadow(
                    color: ItemList.listShadowColor,
                    radius: 5,
                    y: 2)
            }
        }
        .padding(.top, 14)
    }
}

#if DEBUG
struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        return ItemList(luggage: luggage1).previewLayout(.sizeThatFits)
    }
}
#endif
