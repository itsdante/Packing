//
//  ItemList.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageListCard: View {
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
                Text(luggage.categoryString)
                    .font(LuggageListCard.sectionFont)
                    .foregroundColor(LuggageListCard.sectionFontColor)
                Spacer()
                Text("\(luggage.items.filter({ $0.isCompleted == true }).count )/\(luggage.items.count) items")
                    .font(LuggageListCard.sectionCountFont)
                    .foregroundColor(LuggageListCard.sectionCountColor)
                Image(systemName: self.isExpanded ? LuggageListCard.dropDownImageDown : LuggageListCard.dropDownImageUp)
                    .resizable()
                    .frame(width: 14, height: 9)
                    .font(LuggageListCard.dropDownImageFont)
                    .foregroundColor(LuggageListCard.dropDownImageColor)
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
                                .foregroundColor(LuggageListCard.addItemColor)
                            TextField("Add New Item", text: self.$newItem, onCommit: {
                                
                            })
                                .font(LuggageListCard.addItemFont)
                                .foregroundColor(LuggageListCard.addItemColor)
                        }
                        .padding(.vertical, 5)
                        ForEach(luggage.items.sorted { $0.isCompleted && $1.isCompleted }) { item in
                            LuggageItemCell(item: item)
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
                    color: LuggageListCard.listShadowColor,
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
        return LuggageListCard(luggage: luggage1).previewLayout(.sizeThatFits)
    }
}
#endif