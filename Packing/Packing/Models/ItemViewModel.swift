//
//  ItemViewModel.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

class ItemViewModel: ObservableObject {
    @Published var item = Item(name: "Empty", quantity: 1, isCompleted: false, createdAt: Date())
    
    func updateData(item: Item) {
        self.item = item
    }
    
    func markComplete() {
        self.item.isCompleted.toggle()
    }
    
    func increaseQuantity() {
        self.item.quantity += 1
    }
    
    func decreaseQuantity() {
        self.item.quantity -= 1
    }
}
