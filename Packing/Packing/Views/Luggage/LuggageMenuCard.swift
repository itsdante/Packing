//
//  LuggageMenuCard.swift
//  Packing
//
//  Created by Andimas Bagaswara on 04/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct LuggageMenuCard: View {
    private static var shadowColor: Color = Color.init(UIColor.init(hex: 0x636363, alpha: 0.2))
    
    init(uuid: UUID, isMenuPresented: Binding<Bool>) {
        self._isMenuPresented = isMenuPresented
        self._tripResults = FetchRequest(entity: TripModel.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", uuid as CVarArg))
    }
    
    @EnvironmentObject var appState: AppState
    @State var isEditActive: Bool = false
    @Binding var isMenuPresented: Bool
    
    @FetchRequest var tripResults: FetchedResults<TripModel>
    
    var trip = Trip(bookingNumber: "71938JC", airline: "Lion Air", flightNumber: "GA4828", originAirportCode: "CGK", originAirport: "Soekarno-Hatta Int. Airport", originCity: "Jakarta", originCountry: "Indonesia", destinationAirportCode: "HKG", destinationAirport: "Hong Kong Int. Airport", destinationCity: "Hong Kong", destinationCountry: "China", departureDate: Calendar.current.date(byAdding: .hour, value: 24, to: Date())!, arrivalDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!.addingTimeInterval(5000), createdAt: Date(), luggages: [], restrictions: [])
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.clear)
                .onTapGesture {
                    self.isMenuPresented.toggle()
            }
            if isMenuPresented {
                GeometryReader { (proxy: GeometryProxy) in
                    VStack(alignment: .leading) {
                        Group {
                            NavigationLink(destination: RestrictionView()) {
                                Text("View Restricted Items")
                                    .modifier(EditButtonModifier())
                            }
                            Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        Group {
                            Button(action: {
                                
                            }) {
                                Text("Edit Activities")
                                    .modifier(EditButtonModifier())
                            }
                            Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        Group {
                            NavigationLink(destination: SelectLuggagePage(selectedGender: self.tripResults.first!.luggageModelArray.first!.gender, trip: self.trip, isEditMode: true), isActive: self.$isEditActive) {
                                Text("Edit Luggage")
                                    .modifier(EditButtonModifier())
                            }
                            .isDetailLink(false)
                            Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        Group {
                            Button(action: {
                                
                            }) {
                                Text("Sort List")
                                    .modifier(EditButtonModifier())
                            }
                            Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        Group {
                            Button(action: {
                                
                            }) {
                                Text("Uncheck All")
                                    .modifier(EditButtonModifier())
                            }
                            Divider().frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        Group {
                            Button(action: {
                                
                            }) {
                                Text("Delete Trip")
                                    .modifier(EditButtonModifier())
                            }
                        }
                    }
                    .padding()
                    .background(Color.init(.white)
                    .cornerRadius(11)
                    .shadow(color: LuggageMenuCard.shadowColor, radius: 2, y: 2))
                    .animation(.spring())
                    .frame(width: proxy.size.width - 43, height:proxy.size.height, alignment: .topTrailing)
                }
            }
        }
        .onReceive(self.appState.$moveToLuggage) { moveToParent in
            if moveToParent {
                self.isEditActive = false
                self.appState.moveToLuggage = false
            }
        }
    }
}

struct EditButtonModifier: ViewModifier {
    private static let ButtonFont: Font = Font.custom("Poppins-Regular", size: 14)
    private static let ButtonColor: Color = Color.init(UIColor(hex: 0x666666))
    
    func body(content: Content) -> some View {
        content
            .font(EditButtonModifier.ButtonFont)
            .foregroundColor(EditButtonModifier.ButtonColor)
    }
}

//#if DEBUG
//struct LuggageMenuCard_Previews: PreviewProvider {
//    static var previews: some View {
//        LuggageMenuCard(isMenuPresented: <#Binding<Bool>#>)
//    }
//}
//#endif
