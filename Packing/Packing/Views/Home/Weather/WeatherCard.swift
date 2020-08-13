//
//  WeatherCardView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct WeatherCard: View {
    private static let lightGrey: Color = Color.init(UIColor.init(hex: 0x8A8A8A))
    private static let black: Color = Color.init(UIColor.init(hex: 0x494949))
    private static let shadowColor: Color = Color.init(UIColor.init(hex: 0x654CFF, alpha: 0.07))
    
    let weather: WeatherList
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(UIColor.init(hex: 0xFFFFFF)))
            .overlay(
                VStack{
                    Text(weather.dateTimeString)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(WeatherCard.lightGrey)
                        .padding(.top, 10)
                    Spacer()
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            Image(systemName: weather.conditionName)
                                .resizable()
                                .font(.system(size: 32))
                                .font(Font.title.weight(.light))
                                .foregroundColor(Color.init(UIColor.init(hex: weather.conditionColor)))
                    )
                    Text(weather.temperatureString)
                        .font(.system(size: 24))
                        .fontWeight(.light)
                        .padding(.bottom, 15)
                }
        )
            .frame(
                width: UIScreen.main.bounds.width * 0.24,
                height: UIScreen.main.bounds.height * 0.16
        ).shadow(
            color: WeatherCard.shadowColor,
            radius: 5,
            x: 0,
            y: 2
        )
    }
}

#if DEBUG
struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weather: WeatherList(dateTime: 1578409200, temperature: 25, conditionId: 804)).previewLayout(.sizeThatFits)
    }
}
#endif
