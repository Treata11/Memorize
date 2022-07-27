//
//  ContentView.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 69))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(1000/1618, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.orange ) //function with arguement label
        }
        .padding(.horizontal)
    }

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        return ZStack { //zstack function is a view builder
            let shape = RoundedRectangle(cornerRadius: 13)
            if card.isFaceUp {
                shape.stroke(lineWidth: 3)
                shape.fill(.yellow)
                Text(card.content).font(.largeTitle)
            } else {
                shape
                    .fill(.red)
                }
        }
    }
}






















    






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        }
    }
}
