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
    private static let dropDownImageWidth: CGFloat = 14
    private static let dropDownImageHeight: CGFloat = 9
    private static let dropDownImageFont: Font = Font.title.weight(.semibold)
    private static let dropDownImageColor: Color = Color(UIColor.init(hex: 0x353535))
    
    private static let sectionPadding: CGFloat = 30
    private static let dropDownImagePadding: CGFloat = 30
    
    private static let listCornerRadius: CGFloat = 14
    private static let listLeadingPadding: CGFloat = 22
    
    private static let addItemFont: Font = .system(size: 21, weight: .semibold)
    private static let addItemColor: Color = Color.init(UIColor.init(hex: 0x555B6E))
    
    private static let listXPadding: CGFloat = 7
    private static let listShadowColor: Color = Color.init(UIColor.init(hex: 0x0068FD, alpha: 0.07))
    private static let shadowRadius: CGFloat = 5
    private static let shadowY: CGFloat = 2
    
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
                    .frame(width: ItemList.dropDownImageWidth, height: ItemList.dropDownImageHeight)
                    .font(ItemList.dropDownImageFont)
                    .foregroundColor(ItemList.dropDownImageColor)
            }
            .padding(.leading, ItemList.sectionPadding)
            .padding(.trailing, ItemList.dropDownImagePadding)
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
                                .font(Font.custom("Poppins-Regular", size: 15))
                                .foregroundColor(Color(UIColor.init(hex: 0x555B6E)))
                        }.padding(.vertical, 5)
                        ForEach(luggage.items) { item in
                            ItemCell(item: item)
                        }
                    }
                    .padding(.leading, ItemList.listLeadingPadding)
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                    }
                }
                .frame(height: CGFloat(luggage.items.count + 1) * CGFloat(45))
                .cornerRadius(ItemList.listCornerRadius)
                .padding(.horizontal, ItemList.listXPadding)
                .shadow(
                    color: ItemList.listShadowColor,
                    radius: ItemList.shadowRadius,
                    y: ItemList.shadowY
                )
            }
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = Item(name: "Passport", quantity: 1, isCompleted: false, createdAt: Date())
        let item2 = Item(name: "Documents", quantity: 1, isCompleted: false, createdAt: Date())
        let itemArray: [Item] = [item1, item2]
        let luggage = Luggage(category: "Essentials", isCheckedIn: false, items: itemArray)
        return ItemList(luggage: luggage)
    }
}
