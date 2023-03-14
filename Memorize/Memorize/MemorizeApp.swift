//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/9/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var  game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game )
        }
    }
}
