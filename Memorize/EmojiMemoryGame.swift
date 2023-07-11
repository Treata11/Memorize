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
    var gradientOfTheme: Gradient { gradient(of: theme) }
    var score: String { String(model.score) }
    
//    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
//        switch theme {
//        case .emojiTheme(_, let emojis, let numberOfPairsOfCards, _, _):
//            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
//                var emojis = emojis.randomElement()!
//                print(emojis)
//                return emojis.removeDuplicateCharacters()
//            }
//        }
//    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { _ in
            var emojis = theme.emojis.randomElement()!
                print(emojis)
                return emojis.removeDuplicateCharacters()
            }
    }
    
//    func name(of theme: Theme) -> String {
//        switch theme {
//        case .emojiTheme(let name, _, _, _, _): return name
//        }
//     }
    
    func name(of theme: Theme) -> String {
        return theme.id
     }

//    func color(of theme: Theme) -> Color {
//       switch theme {
//       case .emojiTheme(_, _, _, let color, _): return color
//       }
//    }
    
    func color(of theme: Theme) -> Color {
        theme.color
    }

//   func gradient(of theme: Theme) -> Gradient {
//       switch theme {
//       case .emojiTheme(_, _, _, _, let gradient): return gradient
//       }
//   }
    
    func gradient(of theme: Theme) -> Gradient {
        theme.gradient
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🤯", "🥹", "😆"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
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
