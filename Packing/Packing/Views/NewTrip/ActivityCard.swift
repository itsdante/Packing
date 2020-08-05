//
//  ActivityCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct ActivityCard: View {
    @Binding var selectedActivity: [Luggage]
    
    let option: [String]? = ["beach", "hike", "formal", "winter", "swimming", "gym", "photography", "business", "party"]
    let categoryOption: [Luggage.Category] = [Luggage.Category.beach, Luggage.Category.hike, Luggage.Category.formal, Luggage.Category.winter, Luggage.Category.swimming, Luggage.Category.gym, Luggage.Category.photography, Luggage.Category.business, Luggage.Category.party]
    
    var optionIndex: Int?
    var selectedGender: String?
    var selectedLuggage: [Int]?
    
    @State var myImage: Image!
    
    var imageUrl: String!
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .init(UIColor(red: 0.396, green: 0.298, blue: 1, alpha: 0.1)), radius: 21, x: 0, y: 6)
            if (myImage != nil){
                myImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
            }
//            if selectedActivity.contains(where: { $0.category == self.categoryOption[self.optionIndex] }) {
//                myImage?
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
//            } else {
//                Rectangle()
//                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
//                    .foregroundColor(.white)
//                    .cornerRadius(20)
//                    .shadow(color: .init(UIColor(red: 0.396, green: 0.298, blue: 1, alpha: 0.1)), radius: 21, x: 0, y: 6)
//                Image("\(option[optionIndex])")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.14)
//            }
        }.onAppear {
            let url = URL(string: self.imageUrl ?? "https://topgrowth.sgp1.digitaloceanspaces.com/Hike%20Default.png")
            
            if let data = try? Data(contentsOf: url!) {
                let image = UIImage(data: data)
                self.myImage = Image(uiImage: image!)
                }
        }
//        .onTapGesture {
//            if self.selectedActivity.contains(where: { $0.category == self.categoryOption[self.optionIndex] }) {
//                self.selectedActivity.removeAll(where: { $0.category == self.categoryOption[self.optionIndex] })
//            } else {
//                self.selectedActivity.append(Luggage(category: self.categoryOption[self.optionIndex], isCheckedIn: self.selectedLuggage.contains(2) ? true : false, gender: self.selectedGender))
//            }
//        }
        
    }
}
