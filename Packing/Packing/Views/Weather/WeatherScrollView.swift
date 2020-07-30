//
//  WeatherScrollView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct WeatherScrollView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var cityName: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(networkManager.weathers) { weather in
                    WeatherCardView(weather: weather)
                }
            }.frame(height: 130)
                .padding(.bottom, 15)
                .padding(.leading, 35)
                .padding(.trailing, 35)
        }.onAppear {
            self.networkManager.fetchData(cityName: self.cityName)
        }
    }
}


struct WeatherScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScrollView(cityName: "London").previewLayout(.sizeThatFits)
    }
}
