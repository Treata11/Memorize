//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var store: EmojiMemoryGameStore
    @StateObject var game: EmojiMemoryGame
    
    init() {
        _game = StateObject(wrappedValue: EmojiMemoryGame(emojiMemoryGameStore: $store))
    }
//    init(store: Binding<EmojiMemoryGameStore>, game: EmojiMemoryGame) {
//        _store = store
//        _game = StateObject(wrappedValue: EmojiMemoryGame(emojiMemoryGameStore: store))
//    }

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
