//
//  ItemCell.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageItemCell: View {
    private static let purple: Color = Color(UIColor.init(hex: 0x654CFF))
    private static let lightGrey: Color = Color(.secondaryLabel)
    private static let darkGrey: Color = Color(UIColor.init(hex: 0x555B6E))
    private static let black: Color = Color(UIColor.init(hex: 0x262626))
    
    private static let poppinsRegular15: Font = Font.custom("Poppins-Regular", size: 15)
    
    @Environment(\.managedObjectContext) var moc
    @Binding var completedItem:Int
    @Binding var isWarningPresented: Bool
    @ObservedObject var item: ItemModel
    @State var isEditMode = false
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.width * 0.05)
                .foregroundColor(item.isCompleted ? LuggageItemCell.purple : LuggageItemCell.lightGrey)
                .onTapGesture {
                    self.moc.performAndWait {
                        
                        self.item.isCompleted.toggle()
                        if self.item.isCompleted == false
                        {
                            self.completedItem -= 1
                        }
                        else
                        {
                            self.completedItem += 1
                        }
                        try? self.moc.save()
                    }
            }
            Text(item.name)
                .font(LuggageItemCell.poppinsRegular15)
                .foregroundColor(LuggageItemCell.darkGrey)
                .strikethrough(item.isCompleted)
            if item.isRestricted {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(LuggageItemCell.black)
                    .padding(.leading, 23)
                    .onTapGesture {
                        self.isWarningPresented.toggle()
                }
            }
            Spacer()
            if isEditMode {
                HStack {
                    Image(systemName: "minus.square.fill")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.067, height: UIScreen.main.bounds.width * 0.067)
                        .foregroundColor(LuggageItemCell.darkGrey)
                        .onTapGesture {
                            if self.item.quantity != 1 {
                                self.moc.performAndWait {
                                    self.item.quantity -= 1
                                    try? self.moc.save()
                                }
                            }
                    }
                    Text("\(item.quantity)")
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.067, height: UIScreen.main.bounds.width * 0.067)
                        .foregroundColor(LuggageItemCell.darkGrey)
                        .onTapGesture {
                            self.moc.performAndWait {
                                self.item.quantity += 1
                                try? self.moc.save()
                            }
                    }
                }
            } else {
                if item.quantity == 1 {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.067, height: UIScreen.main.bounds.width * 0.067)
                        .foregroundColor(.clear)
                        .overlay(
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.width * 0.04)
                                .onTapGesture {
                                    self.isEditMode.toggle()
                            }
                    )
                } else {
                    Image(systemName: "square.fill")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.067, height: UIScreen.main.bounds.width * 0.067)
                        .foregroundColor(LuggageItemCell.darkGrey)
                        .overlay(
                            Text("\(item.quantity)")
                                .foregroundColor(Color(UIColor.init(hex: 0xFFFFFF)))
                    )
                        .onTapGesture {
                            self.isEditMode.toggle()
                    }
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.isEditMode = false
        }
    }
}

#if DEBUG
//struct ItemCell_Previews: PreviewProvider {
//    @State static var warn : Bool = true
//    static var previews: some View {
//        LuggageItemCell(isWarningPresented: $warn, item: item1).previewLayout(.sizeThatFits)
//    }
//}
#endif
