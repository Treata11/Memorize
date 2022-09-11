//
//  EmojiCardGame.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/21/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
//    private(set) var  cards: MemoryGame<String> //or we can omit <set>
    //set does allow the MV to look at the private var but not tauching it.
    //In this case we use only the private method for trivial reasons.
    
   static let vehicleEmojis: Array<String> = ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"]
    
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

     @Published private var model: MemoryGame<String> = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Theme(s)
    static let Halloween = MemoryGame<String>.Theme.Halloween(Emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",], numberOfPairsOfCards: 10, Color: ".orange")
    
    static let VehicleEmojis = MemoryGame<String>.Theme.Vehicles(Emojis: ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"], numberOfPairsOfCards: 12, Color: ".red")
    
    static let Flags = MemoryGame<String>.Theme.Flags(Emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"], numberOfPairsOfCards: 6, Color: ".blue")
    
    static let Animals = MemoryGame<String>.Theme.Animals(Emojis: ["🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄", "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿", "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"], numberOfPairsOfCards: 16, Color: ".green")
    
    static let People = MemoryGame<String>.Theme.People(Emojis: ["😃", "😍", "😝", "🧐", "😎", "😒", "😱", "☹️", "🥶", "😡", "😶‍🌫️", "🫥", "🤢", "💩", "🤔", "🤩", "🥳", "😜", "🤪", "😇", "🥹", "😂", "🥸", "🤯", "😳", "🫠", "😬", "😈", "🤡", "😻", "😿", "🤠", "😵‍💫"],  numberOfPairsOfCards: 20, Color: ".yellow")
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()   //send to the world that objectWillChange.
        model.choose(card)
    }
}



