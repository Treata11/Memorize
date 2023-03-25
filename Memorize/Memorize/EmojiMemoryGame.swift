//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame(with: themes.randomElement() ?? themes[0])
    
//    static var randomTheme: Theme {
//        get { EmojiMemoryGame.themes.randomElement() ?? EmojiMemoryGame.themes[2] }
//    }

    private var theme: Theme
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    var nameOfTheTheme: String { name(of: theme) }
    var colorOfTheTheme: Color { color(of: theme) }
    var score: String { String(model.score) }
    
    // MARK: - Theme
    
    enum Theme {
        case animals(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case faces(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case flags(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case food(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case halloween(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case sports(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
        case plants(identifier: String, emojis: [String], pairsOfCards: Int, color: Color)
    }
    
    static var themes: Array<Theme> = [
        .animals(
            identifier: "Animals",
            emojis: [
                "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
                "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
                "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
            ],
            pairsOfCards: Int.random(in: 7...11),
            color: .cream
        ),
        .faces(
            identifier: "Faces",
            emojis: [
                "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "😉",
                "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "😋", "😛",
                "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🤫", "🤔", "🤐", "🤨", "😐",
                "😑", "😶", "🙄", "😏", "😒", "🙃", "🤥", "😬", "🤤", "😯", "😦",
                "😧", "😮", "😲", "😴", "🤤", "🤢", "🤮", "🤧", "😵", "🤯", "🤠",
                "😎", "🤓", "🧐", "😕", "😟", "🙁", "☹️", "😮", "😯", "😲", "😳",
                "🥺", "😦", "😧", "😨", "😰", "😥", "😢", "😭", "😱", "😖", "😣",
                "😞", "😓", "😩", "😫", "🥱", "😤", "😡", "😠", "🤬", "😈", "👿",
                "💀", "☠️", "💩", "🤡", "👹", "👺", "👻", "👽", "👾", "🤖", "💩",
                "👨‍🦰", "👩‍🦰", "👨‍🦳", "👩‍🦳", "👨‍🦲", "👩‍🦲", "🤮", "🤯", "🤪", "🤓", "🧐",
                "🕵️‍♂️", "🧝‍♂️", "🤴", "👸", "🤶", "🦸‍♂️", "🦹‍♂️", "🧙‍♂️", "👨‍⚕️", "👩‍⚕️", "👨‍🎓",
                "👩‍🎓", "👨‍⚖️", "👩‍⚖️", "👨‍🌾", "👩‍🌾", "👨‍🍳", "👩‍🍳", "👨‍🔧", "👩‍🔧", "👨‍🏭", "👩‍🏭",
                "👨‍💼", "👩‍💼", "👨‍🔬", "👩‍🔬", "👨‍💻", "👩‍💻", "👨‍🎤", "👩‍🎤", "👨‍🎨", "👩‍🎨", "👨‍✈️",
                "👩‍✈️", "👨‍🚀", "👩‍🚀", "👨‍🚒", "👩‍🚒", "👮‍♂️", "👮‍♀️", "🕵️‍♀️", "🧝‍♀️", "👱‍♂️", "👱‍♀️",
                "🤰", "👼", "🤱", "👲", "🙍‍♂️", "🙍‍♀️", "🙎‍♂️", "🙎‍♀️", "🙅‍♂️", "🙅‍♀️", "🙆‍♂️",
                "🙆‍♀️", "💁‍♂️", "💁‍♀️", "🙋‍♂️", "🙋‍♀️", "🙇‍♂️", "🙇‍♀️", "🤦‍♂️", "🤦‍♀️", "🤷‍♂️", "🤷‍♀️",
                "💆‍♂️", "💆‍♀️", "💇‍♂️", "💇‍♀️", "🚶‍♂️", "🚶‍♀️", "🏃‍♂️", "🏃‍♀️", "💃", "🕺", "🤸‍♂️",
                "🤸‍♀️", "🤼‍♂️", "🤼‍♀️", "🤽‍♂️", "🤽‍♀️", "🤾‍♂️", "🤾‍♀️", "🤹‍♂️", "🤹‍♀️", "👫", "👬",
            ],
            pairsOfCards: Int.random(in: 10...20),
            color: .yellow
        ),
        .flags(
            identifier: "Sports",
            emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
            pairsOfCards: Int.random(in: 3...5),
            color: .purple
        ),
        .food(
            identifier: "Food",
            emojis: [
                "🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌",
                "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱",
                "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦",
                "🍧", "🍢", "🥮", "🍡"
            ],
            pairsOfCards: Int.random(in: 8...14),
            color: .pink
        ),
        .halloween(
            identifier: "Halloween",
            emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",],
            pairsOfCards: Int.random(in: 5...9),
            color: .orange
        ),
        .sports(
            identifier: "Sports",
            emojis: [
                "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
                "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
            ],
            pairsOfCards: Int.random(in: 6...8),
            color: .blue
        ),
        .plants(
            identifier: "Plants",
            emojis: [
                "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
                "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
            ],
            pairsOfCards: Int.random(in: 4...8),
            color: .green
        ),
    ]
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        switch theme {
        case .animals(_, let emojis, let numberOfPairsOfCards, _):
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "🦁🐯🐰🐴"
            }
        case .faces(_, let emojis, let numberOfPairsOfCards, _):
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                 emojis.randomElement() ?? "😃😍😝🧐"
            }
        case .flags(_, let emojis, let numberOfPairsOfCards, _):
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "😃😍😝🧐"
            }
        case .food(_, let emojis, let numberOfPairsOfCards, _):
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "😃😍😝🧐"
            }
        case .halloween(_, let emojis, let numberOfPairsOfCards, _):
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "😃😍😝🧐"
            }
        case .sports(_, let emojis, let numberOfPairsOfCards, _):
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "⚽️🏀🏈⚾️"
            }
        case .plants(_, let emojis, let numberOfPairsOfCards, _):
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "😃😍😝🧐"
            }
        }
    }
    
    func name(of theme: Theme) -> String {
        switch theme {
        case .animals(let name, _, _, _): return name
        case .faces(let name, _, _, _): return name
        case .flags(let name, _, _, _): return name
        case .food(let name, _, _, _): return name
        case .halloween(let name, _, _, _): return name
        case .sports(let name, _, _, _): return name
        case .plants(let name, _, _, _): return name
        }
    }
    
    func color(of theme: Theme) -> Color {
        switch theme {
        case .animals(_, _, _, let color): return color
        case .faces(_, _, _, let color): return color
        case .flags(_, _, _, let color): return color
        case .food(_, _, _, let color): return color
        case .halloween(_, _, _, let color): return color
        case .sports(_, _, _, let color): return color
        case .plants(_, _, _, let color): return color
        }
    }
    
    // MARK: - Access to the Model (Intercome)
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func newGame() {
        model.cards = []
        model.score = 0
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}

extension Color {
    static let cream: Color = Color(red: 249/255, green: 223/255, blue: 205/255)
}


