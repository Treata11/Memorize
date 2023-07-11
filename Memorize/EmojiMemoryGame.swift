//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
//    @Published  private var model: MemoryGame<String> = createMemoryGame()
    
    @Published private var model: MemoryGame<String> = createMemoryGame(with: themes.randomElement()!)

    var theme: Theme 

    init() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }

    var nameOfTheTheme: String { name(of: theme) }
    var colorOfTheme: Color { color(of: theme) }
//    var gradientOfTheme: Gradient { gradient(of: theme) }
    var score: String { String(model.score) }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = Array(theme.emojis).shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func name(of theme: Theme) -> String {
        return theme.id
     }
    
    func color(of theme: Theme) -> Color {
        return Color(rgbaColor: theme.color)
    }

//    func gradient(of theme: Theme) -> Gradient {
////        theme.gradient
//    }
    
    // MARK: - Access to the Model (Intercome)
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func resetGame() {
//        model = EmojiMemoryGame.createMemoryGame()
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
