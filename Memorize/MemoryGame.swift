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
        let chosenIndex = index(of: card)
        cards[Int(chosenIndex)].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> UInt8 {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return UInt8(index)
            }
            print("chosenIndex \(cards)")
        }
        return 0 //bogus!
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




