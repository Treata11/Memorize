//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/26/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var gameInfo: some View {
        HStack {
            Text(viewModel.nameOfTheTheme)
            Spacer()
            Text("Score: \(viewModel.score)")
        }
        .padding()
        .edgesIgnoringSafeArea(.top)
    }
    
    var newGameButton: some View {
        Button {
            withAnimation {
                viewModel.newGame()
            }
        } label: {
            Image(systemName: "gamecontroller").font(.title)
        }
    }
    
    var body: some View {
        VStack {
            gameInfo
            Grid(viewModel.cards) { card in
                CardView(_viewModel: viewModel, card: card)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
            newGameButton
        }
        .padding()
        .foregroundColor(viewModel.colorOfTheme)
    }
}

struct CardView: View {
    @ObservedObject var _viewModel: EmojiMemoryGame
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).fill(_viewModel.gradientOfTheme)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(_viewModel.gradientOfTheme)
                }
            }
        }
        .padding()
        .font(Font.system(size: font(for: size)))
    }

    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 5
              
    func font(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}


// MARK: - Preview(s)

struct _ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

