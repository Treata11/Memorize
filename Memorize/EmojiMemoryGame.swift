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
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()! //Required Task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var colorOfTheme: Color {
        switch theme.color {
        case "red" : return .red
        case "fuchsia": return .purple
        case "cream": return .accentColor
        case "yellow": return .yellow
        case "green": return .green
        case "orange": return .orange
        case"pink": return .pink
        default: return .blue
        }
    }
    
    var score: Int {
        model.score
    }
    
    var nameOfTheme: String {
        theme.name
    }

    var cards: Array<Card> {
        model.cards
    }
    
    //MARK: - Theme(s)
    
    static var themes: Array<Theme> = [
        Theme(name:"Halloween", emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",],
              numberOfPairsOfCards: 6,
              color: "orange"
             ),
        Theme(name: "VehicleEmojis",
              emojis: ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"],
              numberOfPairsOfCards: 12,
              color: "red"
              ),
        Theme(name: "Flags",
              emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
              numberOfPairsOfCards: 6,
              color: "fuchsia"
             ),
        Theme(name: "Animals",
              emojis: ["🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄", "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿", "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"],
              numberOfPairsOfCards: 16,
               color: "cream"
             ),
        Theme(name: "People",
              emojis: ["😃", "😍", "😝", "🧐", "😎", "😒", "😱", "☹️", "🥶", "😡", "😶‍🌫️", "🫥", "🤢", "💩", "🤔", "🤩", "🥳", "😜", "🤪", "😇", "🥹", "😂", "🥸", "🤯", "😳", "🫠", "😬", "😈", "🤡", "😻", "😿", "🤠", "😵‍💫"],
              numberOfPairsOfCards: 20,
              color: "yellow"
             ),
        Theme(name: "Plants",
              emojis: ["🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄", "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"],
              numberOfPairsOfCards: 14,
              color: "green"
             ),
        Theme(name: "Food",
              emojis: ["🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌", "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦", "🍧", "🍢", "🥮", "🍡"],
              numberOfPairsOfCards: 18,
              color: "pink"
             )
    ]
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) { //typealias
        objectWillChange.send()   //send to the world that objectWillChange.
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()! //Required Task 11
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}




