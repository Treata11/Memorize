//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/9/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(viewModel: viewModel, card: card)
                    .onTapGesture {
                        withAnimation(.linear) {
                            viewModel.choose(card)
                        }
                    }
                    .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.colorOfTheme)
            Button {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            } label: {
                Text("New Game")
            }
        }
    }
}

struct CardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: .degrees(0-90), endAngle: .degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear() {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: .degrees(0-90), endAngle: .degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5).opacity(0.4).saturation(1.5).contrast(1.5)
                .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: font(for: size)))
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Drawing Constants
              
    private func font(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7 
    }
}

// MARK: - Preview(s)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: <#Theme#>)
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: <#Theme#>))
    }
}
