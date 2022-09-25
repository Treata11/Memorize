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
        VStack {
            HStack {
                Text(game.nameOfTheme).foregroundColor(game.colorOfTheme)
                Spacer()
                Text("Points: \(game.score)").colorInvert()
            }
            
            AspectVGrid(items: game.cards, aspectRatio: 1000/1618, content: {card in CardView(card)
                    .padding(3.3)
                    .layoutPriority(100)
                    .onTapGesture {
                    game.choose(card)
                        }
                })

                    Button {
                        game.newGame()
                    } label: {
                        Image(systemName: "gamecontroller").font(.largeTitle)
                    }
                    
                .foregroundColor(game.colorOfTheme)
                .padding(.horizontal)
        }
//    }
}
    
struct CardView: View, Animatable {
    private let card: EmojiMemoryGame.Card  //MemoryGame<String>.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }

    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius )
                if card.isFaceUp {
                    shape.fill(.white).blur(radius: 39)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0.113)
                } else {
                    shape.fill()
                }
            }
        })
//        .edgesIgnoringSafeArea([])
    }
    
    private func font(in size: CGSize) -> Font {
        (Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale ))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 11
        static let lineWidth: CGFloat = 2.6
        static let fontScale: CGFloat = 0.81
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
