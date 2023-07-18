//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/18/23.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var emojiTheme: EmojiThemes
    
    @Binding var theme: Theme

    var body: some View {
        Form {
            Section() {
//                Grid(emojiTheme.savedThemes.first!.emojis.map { String($0) }, id: \.self) { emoji in
                AspectVGrid(items: theme.emojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                    Text(emoji).font(Font.system(size: 40))
                        .onTapGesture {
                           
                        }
                }
            }
        }
    }
}
