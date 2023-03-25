//
//  MemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var score: Int = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2  // A2
                } else {
                    if cards[chosenIndex].hasAlreadyBeenSeen {
                        score -= 1  // A2
                    }
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].hasAlreadyBeenSeen = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func shuffle() { //A1
        self.cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle() // A1
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var hasAlreadyBeenSeen = false  // A2
        var content: CardContent
        var id: Int
    }
}
