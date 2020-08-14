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
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var luggage: LuggageModel
    @State var completedItem: Int = 0
    @Binding var isWarningPresented: Bool
    @State var isExpanded: Bool = true
    @State var newItem = ""
    func addNewItem(x:String){
        if x != "" {
            let newItem = ItemModel(context: self.moc)
            newItem.id = UUID()
            newItem.name = x
            newItem.quantity = 1
            newItem.isRestricted = false
            newItem.isCompleted = false
            newItem.createdAt = Date()
            self.luggage.addToItemModel(newItem)
            try? self.moc.save()
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let deletedItem = luggage.itemModelArray.sorted{ $0.isCompleted && $1.isCompleted }[index]
            print(deletedItem)
            moc.delete(deletedItem)
        }
        try? moc.save()
        
        
    }
//    @FetchRequest var items: FetchedResults<ItemModel>
//    init(luggage: LuggageModel, isWarningPresented: Binding<Bool>) {
//        self.luggage = luggage
//        self._isWarningPresented = isWarningPresented
//        var predicate: NSPredicate?
//        predicate = NSPredicate(format: "luggageModel = %@", luggage)
//        self._items = FetchRequest(
//            entity: ItemModel.entity(),
//            sortDescriptors: [],
//            predicate: predicate
//        )
//    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(luggage.category)
                    .font(LuggageListCard.sectionFont)
                    .foregroundColor(LuggageListCard.sectionFontColor)
                Spacer()
                Text("\(completedItem)/\(luggage.itemModelArray.count) items")
                    .font(LuggageListCard.sectionCountFont)
                    .foregroundColor(LuggageListCard.sectionCountColor)
                Image(systemName: self.isExpanded ? LuggageListCard.dropDownImageDown : LuggageListCard.dropDownImageUp)
                    .resizable()
                    .frame(width: 14, height: 9)
                    .font(LuggageListCard.dropDownImageFont)
                    .foregroundColor(LuggageListCard.dropDownImageColor)
            }
            .onAppear{
                self.completedItem = self.luggage.itemModelArray.filter({ $0.isCompleted == true }).count
            }
            .padding(.horizontal, 30)
            .onTapGesture {
//                self.isExpanded.toggle()
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
                                .onTapGesture {
                                    self.addNewItem(x: self.newItem)
                                    self.newItem = ""
                            }
                            TextField("Add New Item", text: self.$newItem, onCommit: {
                                self.addNewItem(x: self.newItem)
                                self.newItem = ""
                            })
                                .font(LuggageListCard.addItemFont)
                                .foregroundColor(LuggageListCard.addItemColor)
                        }
                        .padding(.vertical, 5)
                        ForEach(luggage.itemModelArray,id: \.self) { item in
                            LuggageItemCell(completedItem: self.$completedItem, isWarningPresented: self.$isWarningPresented, item: item).environment(\.managedObjectContext, self.moc)
                        }
                    .onDelete(perform: removeItem)
//                        .onDelete { indexSet in
//                            let deleteOne = self.luggage.itemModel[indexSet.first!]
//                            self.moc.delete(deleteOne)
//                            try? self.moc.save()
//                        }
                    }
                    .padding(.leading, 22)
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                    }
                }
                .frame(height: CGFloat(luggage.itemModelArray.count + 1) * CGFloat(45))
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
//struct ItemList_Previews: PreviewProvider {
//    @State var warn : Bool = true
//    static var previews: some View {
//        return LuggageListCard(luggage: luggage1, isWarningPresented: $warn).previewLayout(.sizeThatFits)
//    }
//}
#endif
