//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var themes = EmojiThemes()
    @StateObject var game: EmojiMemoryGame
    
    init() {
      let theme: Theme
      // Create local instance to retrieve theme
      let localThemes = EmojiThemes()
      theme = localThemes.savedThemes.first!
      
      _game = StateObject(wrappedValue: EmojiMemoryGame(theme: theme))
    }
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

/*
 Declare theme outside the init
 Create a local EmojiThemes instance
 Use the local instance to retrieve the first theme
 Pass that theme to initialize EmojiMemoryGame
 This avoids using the themes property before it is initialized. The local EmojiThemes instance can access savedThemes in its initializer.
 */
