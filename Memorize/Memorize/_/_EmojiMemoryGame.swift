//
//  _EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/26/23.
//

import SwiftUI

//
//  _EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/26/23.
//

import SwiftUI

class _EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = _createMemoryGame(with: _themes.randomElement() ?? _themes[0])
    

    private var _theme: _Theme
    
    init() {
        _theme = _EmojiMemoryGame._themes.randomElement()!
        model = _EmojiMemoryGame._createMemoryGame(with: _theme)
        
    }

    var nameOfTheTheme: String { name(of: _theme) }
    var colorOfTheme: Color { color(of: _theme) }
    var gradientOfTheme: LinearGradient { gradient(of: _theme) }
    var score: String { String(model.score) }
    
    // MARK: - Theme
    
    enum _Theme {
        case emojiTheme(identifier: String, emojis: [String], pairsOfCards: Int, color: Color, gradient: LinearGradient)
    }
    
    static var _themes: [_Theme] = [
        .emojiTheme(
            identifier: "Animals",
            emojis: [
                "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
                "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
                "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
            ],
            pairsOfCards: Int.random(in: 7...11),
            color: .pink,
            gradient: Gradient.animalsEmojisGradient
        ),
        .emojiTheme(
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
            pairsOfCards: Int.random(in: 8...16),
            color: .yellow,
            gradient: Gradient.facesEmojisGradient
        ),
        .emojiTheme(
            identifier: "Flags",
            emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
            pairsOfCards: Int.random(in: 3...5),
            color: .purple,
            gradient: Gradient.flagsEmojisGradient
        ),
        .emojiTheme(
            identifier: "Food",
            emojis: [
                "🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌",
                "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱",
                "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦",
                "🍧", "🍢", "🥮", "🍡"
            ],
            pairsOfCards: Int.random(in: 8...14),
            color: .pink,
            gradient: Gradient.foodEmojisGradient
        ),
        .emojiTheme(
            identifier: "Halloween",
            emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",],
            pairsOfCards: Int.random(in: 5...9),
            color: .orange,
            gradient: Gradient.halloweenEmojisGradient
        ),
        .emojiTheme(
            identifier: "Sports",
            emojis: [
                "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
                "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
            ],
            pairsOfCards: Int.random(in: 6...8),
            color: .blue,
            gradient: Gradient.sportsEmojisGradient
        ),
        .emojiTheme(
            identifier: "Plants",
            emojis: [
                "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
                "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
            ],
            pairsOfCards: Int.random(in: 4...8),
            color: .green,
            gradient: Gradient.plantsEmojisGradient
        ),
    ]
    
    static func _createMemoryGame(with theme: _Theme) -> MemoryGame<String> {
        switch theme {
        case .emojiTheme(_, let emojis, let numberOfPairsOfCards, _, _):
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                var emojis = emojis.randomElement()!
                return emojis.removeDuplicateCharacters()
            }
        }
    }
    
    func name(of theme: _Theme) -> String {
        switch theme {
        case .emojiTheme(let name, _, _, _, _): return name
        }
    }
    
    func gradient(of theme: _Theme) -> LinearGradient {
        switch theme {
        case .emojiTheme(_, _, _, _, let gradient): return gradient
        }
    }
    
    func color(of theme: _Theme) -> Color {
        switch theme {
        case .emojiTheme(_, _, _, let color, _): return color
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
        _theme = _EmojiMemoryGame._themes.randomElement()!
        model = _EmojiMemoryGame._createMemoryGame(with: _theme)
    }
}

