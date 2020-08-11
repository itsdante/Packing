//
//  ActivityCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct ActivityCard: View {
    @Binding var selectedActivity: [String]
    
    let option: [String] = ["beach", "hike", "formal", "winter", "swimming", "gym", "photography", "business", "party"]
    var optionIndex: Int
    var selectedGender: String
    
    var body: some View {
        ZStack {
            if selectedActivity.contains(where: { $0 == self.option[self.optionIndex] }) {
                Image("\(option[optionIndex])-selected")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
            } else {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(color: .init(UIColor(red: 0.396, green: 0.298, blue: 1, alpha: 0.1)), radius: 21, x: 0, y: 6)
                Image("\(option[optionIndex])")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
            }
        }
        .onTapGesture {
            if self.selectedActivity.contains(where: { $0 == self.option[self.optionIndex] }) {
                self.selectedActivity.removeAll(where: { $0 == self.option[self.optionIndex] })
            } else {
                self.selectedActivity.append(self.option[self.optionIndex])
            }
        }
    }
}
