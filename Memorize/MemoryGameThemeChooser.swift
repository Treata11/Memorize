//
//  MemoryGameThemeChooser.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/13/23.
//

import SwiftUI

struct MemoryGameThemeChooser: View {
    @EnvironmentObject var emojiThemes: EmojiThemes
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiThemes.savedThemes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme))
                        .navigationTitle(theme.name)) {
                            VStack(alignment: .leading) {
                                Text(theme.name)
                                Spacer()
                                Text(emojiString(for: theme))
                                RoundedRectangle(cornerRadius: 5).foregroundColor(Color(rgbaColor: theme.color))
                            }
                        }
                }
                .onDelete { indexSet in
                    indexSet.map { emojiThemes.savedThemes[$0] }.forEach { theme in
                        emojiThemes.remove(theme: theme)
                    }
                }
//                ForEach(memoryGame.theme) { theme in
//
//                }
            }
            .navigationTitle("Themes")
        }
    }
    
    private func emojiString(for theme: Theme) -> String {
        var emojis: Set<String> = []
        for _ in 0..<3 {
            emojis.insert(theme.emojis.randomElement()!)
        }
        return emojis.map{ String($0) }.joined(separator: " ")
    }
    
}

struct MemoryGameThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameThemeChooser().environmentObject(EmojiThemes())
    }
}
