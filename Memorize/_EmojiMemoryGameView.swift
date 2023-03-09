//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//
import SwiftUI

struct _EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Spacer()
//                    Text("Points: \(game.score)").colorInvert()
                }
                .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 66))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(1000/1618, contentMode: .fit)
                            .layoutPriority(100)
                            .onTapGesture{
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
            
            HStack {
                shuffle
                Spacer()
                Button {
                    game.newGame()
                } label: {
                    Image(systemName: "gamecontroller").font(.largeTitle)
                }
            }
            .padding(.horizontal)
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
    
    struct CardView: View {
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
            .edgesIgnoringSafeArea([.top])
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
}

struct _EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            _EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
            _EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
            }
    }
}
