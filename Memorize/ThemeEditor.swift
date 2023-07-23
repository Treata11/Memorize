//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/18/23.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var emojiTheme: EmojiThemes
    
    @Binding var theme: Theme?
    
    @State private var themeToEdit: Theme
    
    init(theme: Binding<Theme?>) {
        _theme = theme
        _themeToEdit = State(wrappedValue: theme.wrappedValue ?? ThemeEditor.blankTheme)
    }
    
    static var blankTheme = Theme(
        id: UUID(), name: "Untitled",
        emojis: [], removedEmojis: [],
        pairsOfCards: 0, color: RGBAColor(color: .accentColor)
    )

    var body: some View {
        Form {
            Section("Name of the Theme") {
                TextEditor(text: $themeToEdit.name)
            }
            Section("Manage Emojis") {
//                Grid(emojiTheme.savedThemes.first!.emojis.map { String($0) }, id: \.self) { emoji in
                AspectVGrid(items: themeToEdit.emojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                    Text(emoji).font(Font.system(size: fontSize))
                        .onTapGesture {
                            // TODO: the removing of the emojis
                        }
                }
                .frame(height: height)
            }
            Section("Number of pairs of Cards") {
                
            }
            Section("Choose Color") {
                
            }
        }
    }
    
    // MARK: - Drawing Constants

    var height: CGFloat {
        (CGFloat((themeToEdit.emojis.count - 1) / 6) * 70 + 70 ) * 0.55
        // Paul played around and came up with this sort of calculation as best fit!
    }
    
    let fontSize: CGFloat = 40
}
