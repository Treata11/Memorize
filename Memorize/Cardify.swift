//
//  Cardify.swift
//  Memorize
//
//  Created by Treata Norouzi on 4/12/23.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier, AnimatableModifier {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var rotation: Double
    
    init(isFaceUp: Bool, viewModel: EmojiMemoryGame) {
        rotation = isFaceUp ? 0 : 180
        self.viewModel = viewModel
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).fill(viewModel.gradientOfTheme)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill(viewModel.gradientOfTheme)
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation) , axis: (0,1,0))
        .padding(3)
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 5
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, viewModel: EmojiMemoryGame()))
    }
}
