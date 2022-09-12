//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 66))]) {
                ForEach(game .cards) { card in
                    CardView(card)
                        .aspectRatio(1000/1618, contentMode: .fit)
                        .onTapGesture{
                            game.choose(card)
                        }
                    } 
                }
            }
            .foregroundColor(.orange ) //function with arguement label
        .padding(.horizontal)
    }

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card 
    }

    var body: some View {
        return ZStack { //zstack function is a view builder
            let shape = RoundedRectangle(cornerRadius: 11)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 2.6)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0.013)
            } else {
                shape.fill(Color(.red))
            }
        }
        .foregroundColor(.red)
    }
}



           
            













    






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        }
    }
}
