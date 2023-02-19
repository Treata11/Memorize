//
//  UtilityViews.swift
//  Memorize
//
//  Created by Treata Norouzi on 2/19/23.
//

import SwiftUI

//extension View {
//    struct AnimatableText: View {
//        let rotationAngle: Angle
//
//        var body: some View {
//            Text.self
//                .rotationEffect(rotationAngle, anchor: .center)
//        }
//    }
//}

struct AnimatableText: View {
    let text: String
    let angle: Angle
    
    var body: some View {
        Text(text)
            .rotationEffect(angle, anchor: .center)
    }
}
