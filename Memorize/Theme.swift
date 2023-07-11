//
//  Theme.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/24/23.
//
import SwiftUI
import Foundation

struct Theme: Identifiable, Hashable {
    let id: String
    var emojis: Set<String>
    var pairsOfCards: Int
//    var color: Color
    var color: RGBAColor
//    var gradient: Gradient
}

var themes: Set<Theme> = [
    Theme(
        id: "Animals",
        emojis: [
            "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
            "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
            "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
        ],
        pairsOfCards: Int.random(in: 7...11),
        color: .init(color: .pink)
//        gradient: Gradient.animalsEmojisGradient
    ),
    Theme(
        id: "People & Faces",
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
            "🤸‍♀️", "🤼‍♂️", "🤼‍♀️", "🤽‍♂️", "🤽‍♀️", "🤾‍♂️", "🤾‍♀️", "🤹‍♂️", "🤹‍♀️", "💆‍♂️", "💆‍♀️",
            "💇‍♂️", "💇‍♀️", "🚶‍♂️", "🚶‍♀️", "💃", "🕺", "🤹‍♂️", "🤹‍♀️", "👫",
        ],
        pairsOfCards: Int.random(in: 8...16),
        color: .init(color: .yellow)
//        gradient: Gradient.animalsEmojisGradient
    ),
    Theme(
        id: "Flags",
        emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
        pairsOfCards: Int.random(in: 3...5),
        color: .init(color: .purple)
//        gradient: Gradient.flagsEmojisGradient
    ),
    Theme(
        id: "Food",
        emojis: [
            "🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌",
            "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱",
            "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦",
            "🍧", "🍢", "🥮", "🍡"
        ],
        pairsOfCards: Int.random(in: 8...14),
        color: .init(color: .red)
//        gradient: Gradient.foodEmojisGradient
    ),
    Theme(
        id: "Halloween",
        emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",],
        pairsOfCards: Int.random(in: 5...9),
        color: .init(color: .orange)
//        gradient: Gradient.halloweenEmojisGradient
    ),
    Theme(
        id: "Sports",
        emojis:  [
            "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
            "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
        ],
        pairsOfCards: Int.random(in: 6...8),
        color: .init(color: .blue)
//        gradient: Gradient.sportsEmojisGradient
    ),
    Theme(
        id: "Plants",
        emojis:  [
            "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
            "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
        ],
        pairsOfCards: Int.random(in: 4...10),
        color: .init(color: .green)
//        gradient: Gradient.plantsEmojisGradient
    ),
]

//enum Theme {
//    case emojiTheme(identifier: String, emojis: Set<String>, pairsOfCards: Int, color: Color, gradient: Gradient)
//}
//
//var themes: [Theme] = [
//    .emojiTheme(
//        identifier: "Animals",
//        emojis: [
//            "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋", "🦄",
//            "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬", "🦢", "🐿",
//            "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈", "🦭"
//        ],
//        pairsOfCards: Int.random(in: 7...11),
//        color: .pink,
//        gradient: Gradient.animalsEmojisGradient
//    ),
//    .emojiTheme(
//        identifier: "Faces & People",
//        emojis: [
//            "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "😉",
//            "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "😋", "😛",
//            "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🤫", "🤔", "🤐", "🤨", "😐",
//            "😑", "😶", "🙄", "😏", "😒", "🙃", "🤥", "😬", "🤤", "😯", "😦",
//            "😧", "😮", "😲", "😴", "🤤", "🤢", "🤮", "🤧", "😵", "🤯", "🤠",
//            "😎", "🤓", "🧐", "😕", "😟", "🙁", "☹️", "😮", "😯", "😲", "😳",
//            "🥺", "😦", "😧", "😨", "😰", "😥", "😢", "😭", "😱", "😖", "😣",
//            "😞", "😓", "😩", "😫", "🥱", "😤", "😡", "😠", "🤬", "😈", "👿",
//            "💀", "☠️", "💩", "🤡", "👹", "👺", "👻", "👽", "👾", "🤖", "💩",
//            "👨‍🦰", "👩‍🦰", "👨‍🦳", "👩‍🦳", "👨‍🦲", "👩‍🦲", "🤮", "🤯", "🤪", "🤓", "🧐",
//            "🕵️‍♂️", "🧝‍♂️", "🤴", "👸", "🤶", "🦸‍♂️", "🦹‍♂️", "🧙‍♂️", "👨‍⚕️", "👩‍⚕️", "👨‍🎓",
//            "👩‍🎓", "👨‍⚖️", "👩‍⚖️", "👨‍🌾", "👩‍🌾", "👨‍🍳", "👩‍🍳", "👨‍🔧", "👩‍🔧", "👨‍🏭", "👩‍🏭",
//            "👨‍💼", "👩‍💼", "👨‍🔬", "👩‍🔬", "👨‍💻", "👩‍💻", "👨‍🎤", "👩‍🎤", "👨‍🎨", "👩‍🎨", "👨‍✈️",
//            "👩‍✈️", "👨‍🚀", "👩‍🚀", "👨‍🚒", "👩‍🚒", "👮‍♂️", "👮‍♀️", "🕵️‍♀️", "🧝‍♀️", "👱‍♂️", "👱‍♀️",
//            "🤰", "👼", "🤱", "👲", "🙍‍♂️", "🙍‍♀️", "🙎‍♂️", "🙎‍♀️", "🙅‍♂️", "🙅‍♀️", "🙆‍♂️",
//            "🙆‍♀️", "💁‍♂️", "💁‍♀️", "🙋‍♂️", "🙋‍♀️", "🙇‍♂️", "🙇‍♀️", "🤦‍♂️", "🤦‍♀️", "🤷‍♂️", "🤷‍♀️",
//            "💆‍♂️", "💆‍♀️", "💇‍♂️", "💇‍♀️", "🚶‍♂️", "🚶‍♀️", "🏃‍♂️", "🏃‍♀️", "💃", "🕺", "🤸‍♂️",
//            "🤸‍♀️", "🤼‍♂️", "🤼‍♀️", "🤽‍♂️", "🤽‍♀️", "🤾‍♂️", "🤾‍♀️", "🤹‍♂️", "🤹‍♀️", "💆‍♂️", "💆‍♀️",
//            "💇‍♂️", "💇‍♀️", "🚶‍♂️", "🚶‍♀️", "💃", "🕺", "🤹‍♂️", "🤹‍♀️", "👫",
//        ],
//        pairsOfCards: Int.random(in: 8...16),
//        color: .yellow,
//        gradient: Gradient.facesEmojisGradient
//    ),
//    .emojiTheme(
//        identifier: "Flags",
//        emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
//        pairsOfCards: Int.random(in: 3...5),
//        color: .purple,
//        gradient: Gradient.flagsEmojisGradient
//    ),
//    .emojiTheme(
//        identifier: "Food",
//        emojis: [
//            "🍖", "🥩", "🥓", "🥞", "🥐", "🥯", "🫒", "🥑", "🍏", "🍆", "🍌",
//            "🥥", "🥟", "🍥", "🍚", "🍤", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱",
//            "🥘", "🥗", "🫔", "🌭", "🌮", "🌯", "🍿", "🍫", "🍭", "🍬", "🍦",
//            "🍧", "🍢", "🥮", "🍡"
//        ],
//        pairsOfCards: Int.random(in: 8...14),
//        color: .pink,
//        gradient: Gradient.foodEmojisGradient
//    ),
//    .emojiTheme(
//        identifier: "Halloween",
//        emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽",],
//        pairsOfCards: Int.random(in: 5...9),
//        color: .orange,
//        gradient: Gradient.halloweenEmojisGradient
//    ),
//    .emojiTheme(
//        identifier: "Sports",
//        emojis: [
//            "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
//            "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
//        ],
//        pairsOfCards: Int.random(in: 6...8),
//        color: .blue,
//        gradient: Gradient.sportsEmojisGradient),
//    .emojiTheme(
//        identifier: "Plants",
//        emojis: [
//            "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
//            "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
//        ],
//        pairsOfCards: Int.random(in: 4...8),
//        color: .green,
//        gradient: Gradient.plantsEmojisGradient
//    ),
//]
