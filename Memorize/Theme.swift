//
//  Theme.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/24/23.
//
import Foundation
import SwiftUI

struct Theme: Identifiable, Equatable, Hashable, Codable {
    var id: UUID
    let name: String
    var emojis: Set<String>
    var removedEmojis: Set<String>
    var pairsOfCards: Int
    var color: RGBAColor
//    var gradient: Gradient
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static var themes = [animals, faces, flags, halloween, sports, plants, greek,]
    
    static let animals = Theme(
        id: UUID(),
        name: "Animals",
        emojis: [
            "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋",
            "🦄", "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬",
            "🦢", "🐿", "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈",
            "🦭"
        ],
        removedEmojis: [],
        pairsOfCards: Int.random(in: 7...11),
        color: .pink
        //        gradient: Gradient.animalsEmojisGradient
    )
    static let faces = Theme(
        id: UUID(),
        name: "People & Faces",
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
        removedEmojis: [],
        pairsOfCards: Int.random(in: 8...16),
        color: .yellow
        ////        gradient: Gradient.animalsEmojisGradient
    )
    static let flags = Theme(
        id: UUID(),
        name: "Flags",
        emojis: ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇦🇶"],
        removedEmojis: [],
        pairsOfCards: Int.random(in: 3...5),
        color: .fuchsia
        ////        gradient: Gradient.flagsEmojisGradient
    )
    static let halloween = Theme(
        id: UUID(),
        name: "Halloween",
        emojis: ["💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "👽", "☠️"],
        removedEmojis: [],
        pairsOfCards: Int.random(in: 5...9),
        color: .orange
        ////        gradient: Gradient.halloweenEmojisGradient
    )
    static let sports = Theme(
        id: UUID(),
        name: "Sports",
        emojis:  [
            "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥊",
            "🥋", "⛷", "⛹️‍♀️", "🏋️‍♀️", "🤼‍♀️", "🤽‍♂️", "🤾‍♂️", "🏌️‍♂️", "🏇", "🧘‍♂️", "🛹"
        ],
        removedEmojis: [],
        pairsOfCards: Int.random(in: 6...8),
        color: .blue
        ////        gradient: Gradient.sportsEmojisGradient
    )
    static let plants = Theme(
        id: UUID(),
        name: "Plants",
        emojis:  [
            "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🍄",
            "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻", "🌹"
        ],
        removedEmojis: [],
        pairsOfCards: Int.random(in: 4...10),
        color: .green
        ////        gradient: Gradient.plantsEmojisGradient
    )
    static let greek = Theme(
        id: UUID(),
        name: "Greek",
        emojis: ["ρ", "π", "δ", "ζ", "ξ", "ε", "ψ", "ω", "β", "μ"],
        removedEmojis: [],
        pairsOfCards: 6,
        color: RGBAColor(color: .cream)
    )
                    
//    init(id: UUID, name: String, emojis: Set<String>, pairsOfCards: Int, color: RGBAColor) {
//        self.id = id
//        self.name = name
//        self.emojis = emojis
//        self.pairsOfCards = pairsOfCards
//        self.color = color
//    }
}

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}
