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
                Text("Points: \(game.score)").foregroundColor(game.colorOfTheme).colorInvert()
            }
            .padding()
            
            AspectVGrid(items: game.cards, aspectRatio: 1000/1618) {card in
                if card.isMatched && !card.isFaceUp {
                    RoundedRectangle(cornerRadius: CardView.DrawingConstants.cornerRadius ).opacity(0.113)
                } else {
                    CardView(card)
                        .padding(3.3)
                        .layoutPriority(100)
                        .onTapGesture {
                        game.choose(card)
                        }
                    }
                }
            .foregroundColor(game.colorOfTheme)

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
                    Pie(startAngel: Angle.degrees(0-90), endAngle: Angle.degrees(120-90)).padding(4.1).saturation(1.3).contrast(1.3).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        })
//        .edgesIgnoringSafeArea([])
    }
    
    private func font(in size: CGSize) -> Font {
        (Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale ))
    }
    
    struct DrawingConstants { //bogus, must be private
        static let cornerRadius: CGFloat = 11
        static let fontScale: CGFloat = 0.69
    }
}



           
            













    






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
//        game.choose(game.cards.first!)
             return EmojiMemoryGameView(game: game)
//        Group {
//            EmojiMemoryGameView(game: game)
//                .preferredColorScheme(.dark)
//        }
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
//        }
        }
    }
}
