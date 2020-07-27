//
//  WeatherCardView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct WeatherCardView: View {
    
    let weather: WeatherList
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .overlay(
                VStack{
                    Text(weather.dateTimeString)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.top, 7)
                    Spacer()
                    Image(systemName: weather.conditionName)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.init(UIColor.init(hex: weather.conditionColor)))
                        .font(.system(size: 32))
                    Spacer()
                    Text(weather.temperatureString+"°")
                        .font(.system(size: 24))
                        .fontWeight(.light)
                        .padding(.bottom, 18)
                }
        )
            .frame(
                width: 91,
                height: 130
        ).shadow(
            color: Color.init(UIColor.init(hex: 0x0068FD, alpha: 0.07)),
            radius: 5,
            x: 0,
            y: 2
        )
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCardView(weather: WeatherList(dateTime: 1578409200, temperature: 25, conditionId: 804)).previewLayout(.sizeThatFits)
    }
}
