//
//  EmojiCardGame.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis: Array<String> = ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
        }
    }

     @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) { //typealias
        objectWillChange.send()   //send to the world that objectWillChange.
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}




