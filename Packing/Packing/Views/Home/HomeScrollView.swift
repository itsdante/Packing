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
    
    var trips: [Trip]
    
    var body: some View {
        Pager(page: $pageIndex,
              data: trips,
              content: { trip in
                HomeCard(trip: trip)
        })
            .itemAspectRatio(0.86, alignment: .justified)
    }
}

#if DEBUG
//struct HomeScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeScrollView(pageIndex: <#Binding<Int>#>, trips: [tripTestData, tripTestData2])
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .previewDisplayName("iPhone 8")
//
//            HomeScrollView(pageIndex: <#Binding<Int>#>, trips: [tripTestData, tripTestData2])
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//                .previewDisplayName("iPhone 11")
//        }
//    }
//}
#endif
