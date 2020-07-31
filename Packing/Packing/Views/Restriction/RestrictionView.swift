//
//  RestrictionView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct RestrictionView: View {
    var trip: Trip
    
    var body: some View {
        ScrollView {
            ForEach(trip.restrictions) { restriction in
                RestrictionCard(restriction: restriction)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top, 20)
        .navigationBarTitle("Restricted Items", displayMode: .inline)
    }
}

#if DEBUG
struct RestrictionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RestrictionView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            RestrictionView(trip: tripTestData)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif
