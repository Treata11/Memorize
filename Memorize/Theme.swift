//
//  Theme.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/24/23.
//
import Foundation
import Combine

struct Theme: Identifiable, Hashable {
    var id: UUID
    let name: String
    var emojis: Set<String>
    var pairsOfCards: Int
    var color: RGBAColor
//    var gradient: Gradient
}
