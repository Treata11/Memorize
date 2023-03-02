//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @State private var dealt = Set<UInt8>()
    
    @Namespace private var dealingNamespace 
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        return !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (DrawingConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: DrawingConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.aspectRatio) { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
//                   RoundedRectangle(cornerRadius: CardView.DrawingConstants.cornerRadius )
//                        .opacity(0.113)
                Color.clear
            } else {
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(3.3)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale).animation(.easeInOut(duration: DrawingConstants.dealDuration)))
                    .zIndex(zIndex(of: card))
                // .identity means don't do any animation for this transition
                // except the matchedGeometryEffect
//                    .layoutPriority(100)
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
                }
            }
        .foregroundColor(game.colorOfTheme)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity).animation(.easeInOut(duration: DrawingConstants.dealDuration)))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: DrawingConstants.undealtWidth, height: DrawingConstants.undealtHeight)
        .foregroundColor(game.colorOfTheme)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
         }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation() {
                game.shuffle()
            }
        }
    }
    
    var restart: some View {
        Button("Restart") {
            withAnimation {
                dealt = []
                game.restart()
            }
        }
    }
    
    var newGameButton: some View {
        Button {
            game.newGame()
        } label: {
            Image(systemName: "gamecontroller").font(.largeTitle)
        }
        .foregroundColor(game.colorOfTheme)
    }
    
    var body: some View {
        ZStack(alignment: .bottom ) {
            VStack {
                HStack {
                    Text(game.nameOfTheme).foregroundColor(game.colorOfTheme)
                    Spacer()
                    Text("Points: \(game.score)").foregroundColor(game.colorOfTheme).colorInvert()
                }
                .ignoresSafeArea()
                .padding()
                
                gameBody
                HStack {
                    shuffle
                    Spacer()
                    restart
                    // newGameButton
                }
                .padding(.horizontal)
            }
            deckBody
        }
}
    
struct CardView: View, Animatable {
    let card: EmojiMemoryGame.Card  //MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
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
                    .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: card.content)
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
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
}
    
private struct DrawingConstants {
    static let aspectRatio: CGFloat = 1000/1618
    static let cornerRadius: CGFloat = 11
    static let fontScale: CGFloat = 0.69
    static let fontSize: CGFloat = 29
    static let undealtHeight: CGFloat = 90
    static let undealtWidth = undealtHeight * aspectRatio
    static let dealDuration = 0.5
    static let totalDealDuration = 5.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
//        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 14 Pro Max")
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
