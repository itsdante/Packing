//
//  AppState.swift
//  Packing
//
//  Created by Andimas Bagaswara on 06/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var moveToDashboard: Bool = false
    @Published var isNavigationBarHidden: Bool = true
}
