//
//  UtilityViews.swift
//  Memorize
//
//  Created by Treata Norouzi on 2/19/23.
//

import SwiftUI

struct AnimatableText: View {
    let text: String
    let angle: Angle
    
    var body: some View {
        Text(text)
            .rotationEffect(angle, anchor: .center)
    }
}
