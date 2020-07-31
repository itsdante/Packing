//
//  WeatherScrollView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct WeatherScrollView: View {
    var weathers: [WeatherList]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(weathers) { weather in
                    WeatherCard(weather: weather)
                }
            }.frame(height: UIScreen.main.bounds.height * 0.16)
                .padding(.vertical, 5)
                .padding(.horizontal, 35)
        }
    }
}

#if DEBUG
//struct WeatherScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherScrollView(weathers: [WeatherList]).previewLayout(.sizeThatFits)
//    }
//}
#endif
