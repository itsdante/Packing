//
//  AppState.swift
//  Packing
//
//  Created by Andimas Bagaswara on 06/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            didLaunchBefore = false
        } else {
            didLaunchBefore = true
        }
    }
    
    @Published var moveToRoot: Bool = false
    @Published var isNavigationBarHidden: Bool = true
    @Published var didLaunchBefore: Bool
}
