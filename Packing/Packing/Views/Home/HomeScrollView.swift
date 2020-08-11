//
//  HomeScrollView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 03/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI
import SwiftUIPager

struct HomeScrollView: View {
    @Binding var pageIndex: Int
    
    var trips: [TripModel]
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: UIScreen.main.bounds.height * 0.55)
            .overlay(
                Pager(page: $pageIndex,
                      data: trips,
                      id: \.id,
                      content: { tripModel in
                        HomeCard(trip: tripModel)
                })
                    .itemAspectRatio(0.86)
        )
    }
}

#if DEBUG
//struct HomeScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            StatefulPreviewWrapper(0) {
//                HomeScrollView(pageIndex: $0)
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                    .previewDisplayName("iPhone 8")
//            }
//            
//            StatefulPreviewWrapper(0) {
//                HomeScrollView(pageIndex: $0)
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                    .previewDisplayName("iPhone 11")
//            }
//        }
//    }
//}
#endif
