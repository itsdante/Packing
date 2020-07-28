//
//  LuggageView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 28/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageView: View {
    var trip: Trip
    
    @State private var selected = 0
    
    var body: some View {
        VStack {
            CustomSegmentedPickerView(selected: $selected)
                .padding(.top, 20)
            Spacer()
            if selected == 0 {
                ScrollView {
                    ForEach(trip.luggages) { luggage in
                        ItemList(luggage: luggage)
                    }
                }
            }
            
        }
        .navigationBarTitle("My Luggage", displayMode: .inline)
    }
}

#if DEBUG
struct LuggageView_Previews: PreviewProvider {
    static var previews: some View {
        LuggageView(trip: trip)
    }
}
#endif
