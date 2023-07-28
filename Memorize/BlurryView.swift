//
//  BlurryView.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/28/23.
//

import SwiftUI

/*
 A snippet that I created long before,
 A very simple Approach to have more vivid backgrounds ...
 */
struct BlurryView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

// Call the following modifier on any View to implement the struct
/// .background(BlurryView(style: .systemMaterial))


