//
//  File.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    // MARK: - Theme(s)
    enum Theme: Equatable {
        case Halloween(Emojis: Array<String>, numberOfPairsOfCards: UInt8, Color: String)
        
        case People(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
        
        case Animals(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
        
        case Flags(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
        
        case Vehicles(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
        
//        func chooseTheme(_ Theme: String) -> EmojiMemoryGame.Theme {
//            return EmojiMemoryGame.Theme.People(Emojis: <#T##String#>, numberOfPairsOfCards: <#T##UInt8#>, Color: <#T##String#>) //bogus!
    }
    
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
    init(numberOfPairsOfCards: UInt8, creatCardContent: (UInt8) -> CardContent) {
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
        let content: CardContent
        let id: UInt8
    }
    
    //MARK: - Randomizer

    class LinearCongruentialGenerator  {
        var lastRandom = 42.0
        let m = 139968.0
        let a = 3877.0
        let c = 29573.0
        func random() -> Double {
            lastRandom = ((lastRandom * a + c)
                .truncatingRemainder(dividingBy:m))
            return lastRandom / m
        }
    }

}




