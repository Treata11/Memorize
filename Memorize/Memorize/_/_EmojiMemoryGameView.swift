//
//  _EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/26/23.
//

import SwiftUI

struct _EmojiMemoryGameView: View {
    @ObservedObject var _viewModel: _EmojiMemoryGame
    
    var gameInfo: some View {
        HStack {
            Text(_viewModel.nameOfTheTheme)
            Spacer()
            Text("Score: \(_viewModel.score)")
        }
        .padding()
        .edgesIgnoringSafeArea(.top)
    }
    
    var newGameButton: some View {
        Button {
            withAnimation {
                _viewModel.newGame()
            }
        } label: {
            Image(systemName: "gamecontroller").font(.title)
        }
    }
    
    var body: some View {
        VStack {
            gameInfo
            Grid(_viewModel.cards) { card in
                _CardView(_viewModel: _viewModel, card: card)
                    .onTapGesture {
                        _viewModel.choose(card)
                    }
            }
            newGameButton
        }
        .padding()
        .foregroundColor(_viewModel.colorOfTheme)
    }
    
}

struct _CardView: View {
    @ObservedObject var _viewModel: _EmojiMemoryGame
    
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
        _EmojiMemoryGameView(_viewModel: _EmojiMemoryGame())
    }
}

