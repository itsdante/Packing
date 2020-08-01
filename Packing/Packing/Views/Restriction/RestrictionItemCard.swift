//
//  RestrictionCell.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct RestrictionItemCard: View {
    private static let titleFont: Font = Font.custom("Poppins-SemiBold", size: 16)
    private static let titleColor: Color = Color.init(UIColor.init(hex: 0x4C37C9))
    
    private static let subtitleFont: Font = Font.custom("Poppins-Regular", size: 14)
    private static let subtitleColor: Color = Color.init(UIColor.init(hex: 0x999999))
    
    private static let shadowColor: Color = Color.init(UIColor.init(hex: 0x0068FD, alpha: 0.07))
    
    var restrictionDetail: RestrictionDetail
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
            
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 44.55, height: 44.07)
                    .overlay(
                        Image(restrictionDetail.image)
                ).padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text(restrictionDetail.subTitleString)
                        .font(RestrictionItemCard.titleFont)
                        .foregroundColor(RestrictionItemCard.titleColor)
                    Text(restrictionDetail.subDetail)
                        .font(RestrictionItemCard.subtitleFont)
                        .foregroundColor(RestrictionItemCard.subtitleColor)
                }
                Spacer()
            }
            .padding(.horizontal, 15)
        }
        .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height * 0.08)
        .padding(.horizontal, 24)
        .shadow(
            color: RestrictionItemCard.shadowColor,
            radius: 4,
            y: 3)
    }
}

#if DEBUG
struct RestrictionCell_Previews: PreviewProvider {
    static var previews: some View {
        let restrictionDetail = RestrictionDetail(subTitle: .spareBatteries)
        return RestrictionItemCard(restrictionDetail: restrictionDetail).previewLayout(.sizeThatFits)
    }
}
#endif
