//
//  File.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) -> Void {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[Int(chosenIndex)].isFaceUp.toggle()
        }
    }
    init(numberOfPairsOfCards: Int, creatCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content,
                id: UInt8(pairIndex*2)))
            cards.append(Card(content: content,
                id: UInt8(pairIndex*2+1)))
            }
        }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: UInt8
    }
}




