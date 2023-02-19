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
            .ignoresSafeArea()
            .padding()
            
            AspectVGrid(items: game.cards, aspectRatio: 1000/1618) {card in
                if card.isMatched && !card.isFaceUp {
                    withAnimation {
                       RoundedRectangle(cornerRadius: CardView.DrawingConstants.cornerRadius ).opacity(0.113)
//                        Color.clear
                    }
                } else {
                    CardView(card)
                        .padding(3.3)
                        .layoutPriority(100)
                        .onTapGesture {
                            withAnimation {
                                game.choose(card)
                            }
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
    let card: EmojiMemoryGame.Card  //MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    @State private var rotationAngle: Angle = .degrees(360)
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Group is a "bag of Lego" container
                // it's useful for propagating view modifiers to multiple views
                // (as we are doing below, for example, with opacity)
                Group {
                    // card.isConsumingBonusTime is changed by the Model quite often
                    // it changes any time a card's isFaceUp changes (or isMatched)
                    // so the two Pies here are swapping back and forth as isFaceUp changes
                    // any time we are not consuming bonus time, the lower Pie appears
                    // (it is not animated and is just showing how much time is left)
                    // any time we ARE consuming bonus time, the upper Pie appears
                    // and when it appears (onAppear), it starts animating its own endAngle
                    // by first setting its animatedBonusRemaining to however much time is remaining
                    // then animating setting that to zero inside an explicit animation
                    // (and since this represents a change to animatedBonusRemaining, it will animate that change)
                    // if isConsumingBonusTime changes in the middle of the animation
                    // the top Pie below will simply be removed from the UI and the animation abandoned
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaining)*360-90))
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360-90))
                    }
                }
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false))
                
                // MARK: -ToDo
                
                // A whole new approach to make onDisappear{withAnimation}
                // work is required; have to write a func to actually
                // remove index of matched cards to remove them from UI
                //  
///                AnimatableText(
///                    text: card.content,
///                    angle: rotationAngle
///                )
///                .onDisappear() {
///                    if card.isMatched && card.isFaceUp {
///                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
///                            rotationAngle += .degrees(360)
///                        }
///                    }
///                }
                // MARK: -
                .padding(5)
                .font(Font.system(size: DrawingConstants.fontSize))
                .scaleEffect(scale(thatFits: geometry.size))
            }
            // this is the same as .modifier(Cardify(isFaceUp: card.isFaceUp))
            // it turns our ZStack with a Pie and a Text in it into a "card" on screen
            // it does this by just returning its own ZStack with RoundedRectangles and such in it
            // see Cardify.swift
            .cardify(isFaceUp: card.isFaceUp)
        }
//        .edgesIgnoringSafeArea([])
    }
    
    private func animateTexts(text: String, angle: Angle) -> some View {
        Text(text)
            .rotationEffect(rotationAngle)
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
