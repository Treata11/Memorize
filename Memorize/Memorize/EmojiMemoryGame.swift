//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😃", "😍", "😝", "🧐", "😎", "😒", "😱", "☹️", "🥶", "😡", "😶‍🌫️", "🫥", "🤢", "💩", "🤔", "🤩", "🥳", "😜", "🤪", "😇", "🥹", "😂", "🥸", "🤯", "😳", "🫠", "😬", "😈", "🤡", "😻", "😿", "🤠", "😵‍💫"]
        let randomNumberOfPairsOfCards = Int.random(in: 3...5)  /// (3...6).randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairsOfCards) { _ in
            emojis.randomElement() ?? "😜🤪😵‍💫😳🫠🤡"
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
}
