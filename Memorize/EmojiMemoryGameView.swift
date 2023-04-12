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
        Grid(viewModel.cards) { card in
            CardView(card: card)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: .radians(4.71), endAngle: .radians(0.4), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                    .saturation(1.5)
                    .contrast(1.5)
                Text(card.content)
                    .font(Font.system(size: font(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    /// embeded into a function:
    // There used to be a different syntax for swiftUI
    // That some ViewBuilder like GeometryReader, ForEach ...
    // Used to have self in front of each arguement
    // Instructor embeded the whole body inside a func
    // And called it with self infront of the func to avoid
    // Typing self for serval times.
    
    // MARK: - Drawing Constants
              
    private func font(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7 
    }
}


// MARK: - Preview(s)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: game)
    }
}
