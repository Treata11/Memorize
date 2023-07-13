//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import SwiftUI
import Combine

class EmojiMemoryGame: ObservableObject
{
    @Binding var emojiMemoryGameStore: EmojiMemoryGameStore
    
    @Published private var model: MemoryGame<String>
    
    //TODO: Decode from the JSON file from the store
    @Published var theme: Theme {
        didSet {
            resetGame()
        }
    }
    
//    static var theme = Theme(id: UUID(), name: "", emojis: ["ρ", "π", "δ", "ζ", "ξ", "ε", "ψ", "ω", "β", "μ"], pairsOfCards: 6, color: RGBAColor(color: .white))

    init(emojiMemoryGameStore: Binding<EmojiMemoryGameStore>) {
        _emojiMemoryGameStore = emojiMemoryGameStore
        _theme = Published(wrappedValue: emojiMemoryGameStore.wrappedValue.themes.randomElement()!)
        _model = Published(initialValue: createMemoryGame(with: theme))
    }
    
    var nameOfTheTheme: String { name(of: theme) }
    var colorOfTheme: Color { color(of: theme) }
//    var gradientOfTheme: Gradient { gradient(of: theme) }
    var score: String { String(model.score) }
    
    func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = Array(theme.emojis).shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func name(of theme: Theme) -> String {
        return theme.name
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
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
