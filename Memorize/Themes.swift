//
//  Theme.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/22/22.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var color: String
    
    init(name: String, emojis : [String], numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.color = color
    }
}

//    enum chooseTheme: Equatable {
//        case Halloween(Emojis: Array<String>, numberOfPairsOfCards: UInt8, Color: String)
//
//        case People(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//
//        case Animals(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//
//        case Flags(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//
//        case Vehicles(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//
//        case Plants(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//
//        case Food(Emojis: [String], numberOfPairsOfCards: UInt8, Color: String)
//

//MARK: - Randomizer

//    class LinearCongruentialGenerator  {
//        var lastRandom = 42.0
//        let m = 139968.0
//        let a = 3877.0
//        let c = 29573.0
//        func random() -> Double {
//            lastRandom = ((lastRandom * a + c)
//                .truncatingRemainder(dividingBy:m))
//            return lastRandom / m
//        }
//    }

