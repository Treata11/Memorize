//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/14/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createTheme(theme: themes.randomElement() ?? themes[0])
    
//    static func createMemoryGame() -> MemoryGame<String> {
//        let emojis: Array<String> = ["😃", "😍", "😝", "🧐", "😎", "😒", "😱", "☹️", "🥶", "😡", "😶‍🌫️", "🫥", "🤢", "💩", "🤔", "🤩", "🥳", "😜", "🤪", "😇", "🥹", "😂", "🥸", "🤯", "😳", "🫠", "😬", "😈", "🤡", "😻", "😿", "🤠", "😵‍💫"]
//        let randomNumberOfPairsOfCards = Int.random(in: 3...5)  /// (3...6).randomElement()!
//        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairsOfCards) { _ in
//            emojis.randomElement() ?? "😜🤪😵‍💫😳🫠🤡"
//        }
//    }
    
    // MARK: - Theme
    
    enum Theme {
        case animals(identifier: String, emojis: [String], numberOfPairsOfCards: Int, color: Color)
        case sports(identifier: String, emojis: [String], numberOfPairsOfCards: Int, color: Color)
        case faces(identifier: String, emojis: [String], numberOfPairsOfCards: Int, color: Color)
    }
    
    static var themes: Array<Theme> = [
        .animals(
            identifier: "Animals",
            emojis: [
                "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
                "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
                "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
            ],
            numberOfPairsOfCards: Int.random(in: 7...10),
            color: .green
        ),
        .sports(
            identifier: "Sports",
            emojis: [
                "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
                "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
            ],
            numberOfPairsOfCards: Int.random(in: 6...8),
            color: .blue
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
                "👭", "👨‍❤️‍👨", "👨‍❤️‍💋‍👨", "👩‍❤️‍👩", "👩‍❤️‍💋‍👩", "💑", "👨‍❤️‍👨", "👩‍❤️‍👩", "💏", "👩‍❤️‍💋‍👨", "👨‍❤️‍💋‍👩",
                "👪", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦",
            ],
            numberOfPairsOfCards: Int.random(in: 10...20),
            color: .pink
        ),
    ]
    
//    static var themes: Array<Theme> {
//        for theme in Theme.AllCases {
//
//        }
//    }
    
//    var animalsEmojis: Theme = .animals(
//        identifier: "Animals",
//        emojis: [
//            "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
//            "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
//            "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
//        ],
//        numberOfPairsOfCards: Int.random(in: 6...16),
//        color: .cream
//    )
    
    
    static func createTheme(theme: Theme) -> MemoryGame<String> {
        switch theme {
        case .animals(let identifier, let emojis, let numberOfPairsOfCards, let color):
            let name = identifier
            let color = color
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "🦁🐯🐰🐴"
            }
        case .sports(let identifier, let emojis, let numberOfPairsOfCards, let color):
            let name = identifier
            let color = color
            return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "⚽️🏀🏈⚾️"
            }
        case .faces(let identifier, let emojis, let numberOfPairsOfCards, let color):
            let name = identifier
            let color = color
             return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { _ in
                emojis.randomElement() ?? "😃😍😝🧐"
            }
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
}

extension Color {
    static let cream: Color = Color(red: 249/255, green: 223/255, blue: 205/255)
}


