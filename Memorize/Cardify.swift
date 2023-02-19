//
//  File.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/30/22.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius )
            if isFaceUp {
                shape.fill(.white).blur(radius: 44)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)

        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 11
        static let lineWidth: CGFloat = 2.6
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
