//
//  EmojiCardGame.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
//    private(set) var  cards: MemoryGame<String> //or we can omit <set>
    //set does allow the MV to look at the private var but not tauching it.
    //In this case we use only the private method for trivial reasons.
    
   private static let vehicleEmojis: Array<String> = ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            EmojiMemoryGame.vehicleEmojis[Int(pairIndex)]
        }
    }
    
//    static func CreatMemoryGame() -> MemoryGame<String> {
//        for case in MemoryGame<String>.Theme.case {
//            MemoryGame<String>.Theme.
//        }
//    }

     @Published private var model = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Theme(s)
    private static let Halloween = MemoryGame<String>.Theme.Halloween(Emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",], numberOfPairsOfCards: 10, Color: ".orange")
    
    private static let VehicleEmojis = MemoryGame<String>.Theme.Vehicles(Emojis: ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"], numberOfPairsOfCards: 12, Color: ".red")
    
    private static let Flags = MemoryGame<String>.Theme.Flags(Emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"], numberOfPairsOfCards: 6, Color: ".blue")
    
    private static let Animals = MemoryGame<String>.Theme.Animals(Emojis: ["🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄", "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿", "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"], numberOfPairsOfCards: 16, Color: ".green")
    
    private static let People = MemoryGame<String>.Theme.People(Emojis: ["😃", "😍", "😝", "🧐", "😎", "😒", "😱", "☹️", "🥶", "😡", "😶‍🌫️", "🫥", "🤢", "💩", "🤔", "🤩", "🥳", "😜", "🤪", "😇", "🥹", "😂", "🥸", "🤯", "😳", "🫠", "😬", "😈", "🤡", "😻", "😿", "🤠", "😵‍💫"],  numberOfPairsOfCards: 20, Color: ".yellow")
    // MARK: - Intent(s)
    
    func choose(_ card: Card) { //typealias
        objectWillChange.send()   //send to the world that objectWillChange.
        model.choose(card)
    }
}



