//
//  EmojiCardGame.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
//    private(set) var  cards: MemoryGame<String> //or we can omit <set>
    //set does allow the mv to look at the private var but not tauching it.
    //here we use only the private method.
   static let emojis: Array<String> = ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
        }
    }

     @Published private var model: MemoryGame<String> = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()   //send to the world that objectWillChange.
        model .choose(card)
    }
}



