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
                withAnimation {
                    Pie(startAngel: Angle.degrees(0-90), endAngle: Angle.degrees(120-90)).padding(4.1).saturation(1.3).contrast(1.3).opacity(0.19)
                }
                    Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
//                    .animation(Animation.easeInOut(duration: 1.3))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        })
//        .edgesIgnoringSafeArea([])
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
     
    struct DrawingConstants { //bogus, must be private
        static let cornerRadius: CGFloat = 11
        static let fontScale: CGFloat = 0.69
        static let fontSize: CGFloat = 29
    }
}
    
    
    
    
    
    
    
    
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game).preferredColorScheme(.dark)
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
