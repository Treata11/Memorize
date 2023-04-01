//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/26/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame(with: themes.randomElement() ?? themes[0])
    

    private var theme: Theme
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }

    var nameOfTheTheme: String { name(of: theme) }
    var colorOfTheme: Color { color(of: theme) }
    var gradientOfTheme: LinearGradient { gradient(of: theme) }
    var score: String { String(model.score) }
    
    // MARK: - Theme
    
    enum Theme {
        case emojiTheme(identifier: String, emojis: [String], pairsOfCards: Int, color: Color, gradient: LinearGradient)
        
        // TODO: create a function that shuffles a var of type Theme emojis on call.
        func shuffle() -> [String] {
            switch self {
            case .emojiTheme(_, let emojis, _, _, _): return emojis.shuffled()
            }
        }
    }
    
    static var themes: [Theme] = [
        .emojiTheme(
            identifier: "Animals",
            emojis: {
                var shuffledEmojis = [
                "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
                "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
                "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
            ]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 7...11),
            color: .pink,
            gradient: Gradient.animalsEmojisGradient
        ),
        .emojiTheme(
            identifier: "Faces & People",
            emojis: {
                    var shuffledEmojis = [
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
                    "💆‍♂️", "💆‍♀️", "💇‍♂️", "💇‍♀️", "🚶‍♂️", "🚶‍♀️", "💃", "🕺", "🤹‍♂️", "🤹‍♀️", "👫",
                ]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 8...13),
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
            emojis: {
                    var shuffledEmojis = [
                    "🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌",
                    "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱",
                    "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦",
                    "🍧", "🍢", "🥮", "🍡"
                ]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 8...11),
            color: .pink,
            gradient: Gradient.foodEmojisGradient
        ),
        .emojiTheme(
            identifier: "Halloween",
            emojis: { var shuffledEmojis = ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 5...9),
            color: .orange,
            gradient: Gradient.halloweenEmojisGradient
        ),
        .emojiTheme(
            identifier: "Sports",
            emojis: {
                var shuffledEmojis = [
                "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
                "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹",
                "🤸‍♀️", "🤽‍♀️", "🤾‍♂️", "🤾‍♀️", "🤸‍♂️", "🏃‍♂️", "🏃‍♀️",
            ]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 6...8),
            color: .blue,
            gradient: Gradient.sportsEmojisGradient
        ),
        .emojiTheme(
            identifier: "Plants",
            emojis: { var shuffledEmojis = [
                "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
                "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
            ]
                shuffledEmojis.shuffle()
                return shuffledEmojis
            }(),
            pairsOfCards: Int.random(in: 4...8),
            color: .green,
            gradient: Gradient.plantsEmojisGradient
        ),
    ]
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        switch theme {
        case .emojiTheme(_, let emojis, let numberOfPairsOfCards, _, _):
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { index in
                return emojis[index]
            }
        }
    }
    
    func name(of theme: Theme) -> String {
        switch theme {
        case .emojiTheme(let name, _, _, _, _): return name
        }
    }
    
    func color(of theme: Theme) -> Color {
        switch theme {
        case .emojiTheme(_, _, _, let color, _): return color
        }
    }
    
    func gradient(of theme: Theme) -> LinearGradient {
        switch theme {
        case .emojiTheme(_, _, _, _, let gradient): return gradient
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

