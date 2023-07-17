//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
//    @StateObject var themes = EmojiThemes()
//    @StateObject var game: EmojiMemoryGame
    
//    init() {
//      let theme: Theme
//      // Create local instance to retrieve theme
//      let localThemes = EmojiThemes()
//      theme = localThemes.savedThemes.first!
//
//      _game = StateObject(wrappedValue: EmojiMemoryGame(theme: theme))
//    }
    var body: some Scene {
        WindowGroup {
            MemoryGameThemeChooser().environmentObject(EmojiThemes())
        }
    }
}
