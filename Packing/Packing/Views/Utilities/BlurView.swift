//
//  BlurView.swift
//  Packing
//
//  Created by Andimas Bagaswara on 01/08/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import SwiftUI

struct BlurView: View {
    var effect: UIBlurEffect.Style
    var body: some View {
        VisualEffectView(effect: UIBlurEffect(style: effect))
            .edgesIgnoringSafeArea(.all)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct VisualEffectView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(effect: .dark)
    }
}
