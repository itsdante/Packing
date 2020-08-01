//
//  RestrictionCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 29/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct RestrictionListCard: View {
    private static let titleFont: Font = Font.custom("Poppins-SemiBold", size: 18)
    private static let titleColor: Color = Color.init(UIColor.init(hex: 0x353535))
    
    private static let subtitleFont: Font = Font.custom("Poppins-Light", size: 14)
    private static let subtitleColor: Color = Color.init(UIColor.init(hex: 0x666666))
    
    private static let dropDownImageUp: String = "chevron.up"
    private static let dropDownImageDown: String = "chevron.down"
    private static let dropDownImageFont: Font = Font.title.weight(.semibold)
    private static let dropDownImageColor: Color = Color(UIColor.init(hex: 0x654CFF))
    
    private static let shadowColor: Color = Color.init(UIColor.init(hex: 0x3A4C82, alpha: 0.08))
    
    var restriction: Restriction
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.restriction.mainTitleString)
                    .font(RestrictionListCard.titleFont)
                    .foregroundColor(RestrictionListCard.titleColor)
                Spacer()
                Image(systemName: self.isExpanded ? RestrictionListCard.dropDownImageDown : RestrictionListCard.dropDownImageUp)
                    .resizable()
                    .frame(width: 16, height: 11)
                    .padding(.leading, 20)
                    .font(RestrictionListCard.dropDownImageFont)
                    .foregroundColor(RestrictionListCard.dropDownImageColor)
            }
            .padding(.horizontal, 23)
            
            .onTapGesture {
                self.isExpanded.toggle()
            }
            
            if self.isExpanded{
                Text(self.restriction.mainDetail)
                    .font(RestrictionListCard.subtitleFont)
                    .foregroundColor(RestrictionListCard.subtitleColor)
                    .padding(.horizontal, 23)
                    .padding(.vertical, 5)
                ForEach(self.restriction.restrictionDetail) { restrictionDetail in
                    RestrictionItemCard(restrictionDetail: restrictionDetail)
                }
            }
        }.padding(.vertical, 22)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .shadow(
                    color: RestrictionListCard.shadowColor,
                    radius: 4,
                    y: 4)
        )
            .frame(width: UIScreen.main.bounds.width * 0.88)
            .padding(.horizontal, 23)
        
    }
}

#if DEBUG
struct RestrictionCard_Previews: PreviewProvider {
    static var previews: some View {
        let restriction = Restriction(mainTitle: .batteries)
        return RestrictionListCard(restriction: restriction).previewLayout(.sizeThatFits)
    }
}
#endif
