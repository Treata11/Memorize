//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()    //it isn't so necessary to marked as private since it is the only app object here.
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
