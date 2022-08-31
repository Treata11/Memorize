//
//  File.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOnlyAndOnlyCardFaceUp: UInt8? = Optional<UInt8> .none
    
    mutating func choose(_ card: Card) -> Void {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOnlyAndOnlyCardFaceUp {
                if cards[chosenIndex].content == cards[Int(potentialMatchIndex)].content {
                    cards[Int(potentialMatchIndex)].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfOnlyAndOnlyCardFaceUp = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOnlyAndOnlyCardFaceUp = UInt8(chosenIndex)
            }
            cards[Int(chosenIndex)].isFaceUp.toggle()
        }
        
        print("\(cards)")
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




