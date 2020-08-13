//
//  RestrictionView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct RestrictionView: View {
//    var trip: Trip
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            ForEach(restrictionArray) { restriction in
                RestrictionListCard(restriction: restriction)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top, 20)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
        })
        .navigationBarTitle("Restricted Items", displayMode: .inline)
        .background(Color.init(UIColor.init(hex: 0xF7F8FC)).edgesIgnoringSafeArea(.all))
    }
}

#if DEBUG
//struct RestrictionView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RestrictionView(trip: tripTestData)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("iPhone 8")
//            
//            RestrictionView(trip: tripTestData)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif
