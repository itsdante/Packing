//
//  OnboardingView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 08/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI
import SwiftUIPager

struct OnboardingView: View {
    private static var grey: Color = Color.init(UIColor.init(hex: 0x8A8A8A))
    private static var purple: Color = Color.init(UIColor(hex: 0x654CFF))
    private static var darkPurple: Color = Color.init(UIColor(hex: 0x4C37C9))
    private static var darkGrey: Color = Color.init(UIColor.init(hex: 0x4E4D4D))
    private static var lightGrey: Color = Color.init(UIColor.init(hex: 0x666666))
    private static let yellow: Color = Color.init(UIColor.init(hex: 0xF9B710))
    private static var bgColor: Color = Color.init(UIColor.init(hex: 0xF7F8FC))
    
    private static let yellowShadowColor: Color = Color.init(UIColor.init(hex: 0xD58411, alpha: 0.21))
    private static var purpleShadowColor: Color = Color.init(UIColor.init(hex: 0x2704FE, alpha: 0.2))
    
    private static var systemBold: Font = Font.title.weight(.regular)
    private static var poppinseSemiBold32: Font = Font.custom("Poppins-SemiBold", size: 32)
    private static var poppinsSemiBold12: Font = Font.custom("Poppins-SemiBold", size: 12)
    private static var poppinseRegular17: Font = Font.custom("Poppins-Regular", size: 17)
    
    let onboardingTitleArray: [String] = ["Trouble packing for your trip?", "One-click flight details", "Pre-determined packing list", "Be aware of the restricted items"]
    
    let onboardingSubTitleArray: [String] = ["Just type in your booking code, we’ll handle the rest", "Never forget to pack another item", "Prevent having your items confiscated at the airport"]
    
    let onboardingImageArray: [String] = ["onboarding-1-raw-image", "onboarding-2-raw-image", "onboarding-3-raw-image", "onboarding-4-raw-image"]
    
    @EnvironmentObject var appState: AppState
    @State var pageIndex: Int = 0
    
    var items = Array(0..<4)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if pageIndex != 0 {
                    Button(action: {
                        self.pageIndex -= 1
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(OnboardingView.grey)
                    }
                }
                Spacer()
                if pageIndex != items.count - 1 {
                    Text("Skip")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(OnboardingView.purple)
                        .onTapGesture {
                            self.appState.didLaunchBefore = true
                    }
                }
            }
            .padding(.horizontal, 22)
            Spacer()
            HStack {
                Text(onboardingTitleArray[pageIndex])
                    .foregroundColor(OnboardingView.darkGrey)
                    .font(OnboardingView.poppinseSemiBold32)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding(.horizontal, 36)
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: UIScreen.main.bounds.height * (pageIndex == 0 ? 0.5 : 0.46))
                .overlay(
                    Pager(page: $pageIndex,
                          data: items,
                          id: \.self,
                          content: { index in
                            Image(self.onboardingImageArray[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                    })
            )
            if pageIndex != 0 {
                ZStack {
                    Text(onboardingSubTitleArray[pageIndex-1])
                        .foregroundColor(OnboardingView.lightGrey)
                        .font(OnboardingView.poppinseRegular17)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.054)
            }
            Spacer()
            if pageIndex == items.count - 1 {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .shadow(color: OnboardingView.purpleShadowColor, radius: 4, y: 5)
                        .overlay(
                            Text("Let's Start!")
                                .font(OnboardingView.poppinsSemiBold12)
                                .foregroundColor(.white)
                    )
                        .foregroundColor(OnboardingView.purple)
                        .onTapGesture {
                            self.appState.didLaunchBefore = true
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.04)
            }
            ZStack {
                PageControl(numberOfPages: items.count, currentPage: $pageIndex)
                if pageIndex != items.count - 1 {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            self.pageIndex += 1
                        }) {
                            Circle()
                                .frame(width: UIScreen.main.bounds.width * 0.11, height: UIScreen.main.bounds.height * 0.05)
                                .foregroundColor(OnboardingView.yellow)
                                .shadow(color: OnboardingView.yellowShadowColor, radius: 4, y: 7)
                                .overlay(Image(systemName: "chevron.right")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                            )
                        }
                        .padding(.trailing, 35)
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.05)
            Spacer()
        }
        .background(OnboardingView.bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .previewDevice(PreviewDevice.init(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            OnboardingView()
                .previewDevice(PreviewDevice.init(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
