//
//  WeatherView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main

struct WeatherView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Weather for Upcoming Trip")
                    .foregroundColor(Color(UIColor.init(hex: 0x043479)))
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .frame(width: screen.bounds.width, alignment: .leading)
                    .padding(.leading, 35)
                Text("Hong Kong, China - 11 Jan to 23 Jan, 2020")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .frame(width: screen.bounds.width, alignment: .leading)
                    .padding(.leading, 35)
                WeatherScrollView(cityName: "London")
                Text("OpenWeather")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .frame(width: screen.bounds.width, alignment: .leading)
                    .padding(.leading, 35)
            }
        }.frame(
            width: screen.bounds.width,
            height: 221
        )
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView().previewLayout(.sizeThatFits)
    }
}
