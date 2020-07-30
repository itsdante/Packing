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

struct RestrictionView_Previews: PreviewProvider {
    static var previews: some View {
        RestrictionView(trip: tripTestData)
    }
}
