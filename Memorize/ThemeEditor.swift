//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/18/23.
//

import SwiftUI

struct ThemeEditor: View {
    @EnvironmentObject var emojiTheme: EmojiThemes
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var theme: Theme?
    @Binding var isPresented: Bool {
        willSet {
            if !isPresented { presentationMode.wrappedValue.dismiss() }
        }
    }
    
    @State private var themeToEdit: Theme
    
    init(theme: Binding<Theme?>, isPresented: Binding<Bool>) {
        _theme = theme
        _themeToEdit = State(wrappedValue: theme.wrappedValue ?? ThemeEditor.blankTheme)
        _isPresented = isPresented
    }
    
    public static var blankTheme = Theme(
        id: UUID(), name: "Untitled",
        emojis: [], removedEmojis: [],
        pairsOfCards: 0, color: RGBAColor(color: .accentColor)
    )

    var body: some View {
        VStack(spacing: 0) {
            if isPresented {
                HStack() {
                    Spacer()
                    saveButton
                }
                .padding(.horizontal)
                
                Divider()
            }
            Form {
                Section("Name of the Theme") {
                    TextEditor(text: $themeToEdit.name).unredacted()
                }
                Section("Manage Emojis") {
                    AspectVGrid(items: themeToEdit.emojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                        Text(emoji).font(Font.system(size: fontSize))
                            .onTapGesture {
                                if themeToEdit.emojis.count > 2 {
                                    // TODO: Enhance the feedback with transition
                                    themeToEdit.removedEmojis.insert(themeToEdit.removeEmoji(emoji))
                                } else {
                                    print("Would cause a crash")
                                }
                            }
                    }
                    .frame(height: heightForEmojis)
                }
                Section("Bin") {
                    AspectVGrid(items: themeToEdit.removedEmojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                        Text(emoji).font(Font.system(size: fontSize))
                    }
                    .frame(height: heightForRemovedEmojis)
                }
                Section("Number of pairs of Cards") {
                    if themeToEdit.emojis.count > 0 {
                        Stepper(value: $themeToEdit.pairsOfCards, in: 2...themeToEdit.emojis.count) {
                            Text("\(themeToEdit.pairsOfCards) Pairs")
                        }
                    }
                }
                Section("Choose Color") {
                    // TODO: ColorPicker
                }
            }
            .toolbar {
                //            ToolbarItem(placement: .navigationBarTrailing) {
                //                Button("Done") {
                //                    isPresented = false
                //                }
                //            }
                ToolbarItem(placement: .confirmationAction) {
                    saveButton
                }
            }
        }
    }
    
    var saveButton: some View {
        Button("Done") {
            // TODO: Persist!
            
            isPresented = false
        }
    }
    
    // MARK: - Drawing Constants

    var heightForEmojis: CGFloat {
        return (CGFloat((themeToEdit.emojis.count - 1) / 6) * 70 + 70 ) * 0.55
        // Paul played around and came up with this sort of calculation as best fit!
    }
    
    var heightForRemovedEmojis: CGFloat {
        (CGFloat((themeToEdit.removedEmojis.count - 1) / 6) * 70 + 70 ) * 0.55
    }
    
    let fontSize: CGFloat = 40
}
