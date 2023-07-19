//
//  Cardify.swift
//  Memorize
//
//  Created by Treata Norouzi on 4/12/23.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier, AnimatableModifier {
    @Binding private var theme: Theme
    
    var gradient: Gradient
    var rotation: Double
    
    init(isFaceUp: Bool, theme: Binding<Theme>) {
        rotation = isFaceUp ? 0 : 180
        _theme = theme
        let vivids = Color.calculateGradient(with: theme.color.wrappedValue)
//        gradient = Binding(projectedValue: theme.color.projectedValue)
//        Gradient(colors: Color.calculateGradient(with: theme.color))
        gradient = Gradient(colors: vivids)
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
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    .fill(gradient)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(gradient)
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation) , axis: (0,1,0))
        .padding(3)
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 5
}

extension View {
    func cardify(isFaceUp: Bool, theme: Binding<Theme>) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, theme: theme))
    }
}
