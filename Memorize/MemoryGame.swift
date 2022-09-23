//
//  File.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfOnlyAndOnlyCardFaceUp: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue!) } }
    }

    internal mutating func choose(_ card: Card) -> Void {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOnlyAndOnlyCardFaceUp {
                if cards[chosenIndex].content == cards[Int(potentialMatchIndex)].content {
                    cards[Int(potentialMatchIndex)].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                } else {
                    if cards[indexOfOnlyAndOnlyCardFaceUp!].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen {
                        score -= 1
                    }
                }
                cards[Int(chosenIndex)].isFaceUp = true
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                indexOfOnlyAndOnlyCardFaceUp = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, creatCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content,
                id: UInt8(pairIndex*2)))
            cards.append(Card(content: content,
                id: UInt8(pairIndex*2+1)))
            }
        cards.shuffle()
        }
    
    //PropertyObserver
//    var isFaceUp: Bool {
//        willSet {
//            if newValue {
//                startUsingBonusTime()
//            } else {
//                stopUsingBonusTime()
//            }
//        }
//    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var hasAlreadyBeenSeen = false
        let content: CardContent
        let id: UInt8
    }
}

// MARK: -Extention(s)
extension Array {
    var oneAndOnly: Element? {
        if self.count  == 1 {
            return self.first
        } else {
           return nil
        }
    }
}

