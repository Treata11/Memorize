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
    @State private var emojisToAdd = ""
    @State private var explainThemeInitialization = false
    @State private var explainMinimumCardCountForTheme = false
    
    init(theme: Binding<Theme?>, isPresented: Binding<Bool>) {
        _theme = theme
        _themeToEdit = State(wrappedValue: theme.wrappedValue ?? ThemeEditor.blankTheme)
        _isPresented = isPresented
    }
    
    public static var blankTheme = Theme(
        id: UUID(), name: "Untitled",
        emojis: [], removedEmojis: [],
        pairsOfCards: 2, color: RGBAColor(color: .accentColor)
    )

    var body: some View {
        VStack(spacing: 0) {
            if isPresented {
                HStack() {
                    Button("Cancle") {
                        isPresented = false
                    }
                    Spacer()
                    saveButton.padding(.vertical)
                }
                .padding(.horizontal)
                .background(BlurryView(style: .systemMaterial))
            }
            Form {
                Section("Name of the Theme") {
                    TextEditor(text: $themeToEdit.name).unredacted()
                }
                Section("Add Emoji") {
                    HStack {
                        TextEditor(text: $emojisToAdd)
                        Spacer()
                        Button("Add") {
                            if themeToEdit.emojis.count > 1 {
                                themeToEdit.addEmoji(emojisToAdd)
                                emojisToAdd = ""
                            } else {
                                if emojisToAdd.filter({ !$0.isWhitespace }).count > 1 {
                                    themeToEdit.addEmoji(emojisToAdd)
                                    emojisToAdd = ""
                                } else {
                                    explainMinimumCardCountForTheme = true
                                }
                            }
                        }
                        .alert(isPresented: $explainMinimumCardCountForTheme) {
                            return Alert(
                                title: Text("Not Enough Emojis Are Added"),
///                                message: "Add at least two emojis to the Empty Pack of Theme's emojis to proceed",
                                primaryButton: .default(Text("Add Two Randomly")) {
                                    emojisToAdd += randomEmoji(2)  // bogus!
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
                Section(header: Text("Emojis To Play"), footer: Text("Tap emoji to exclude")) {
                    AspectVGrid(items: themeToEdit.emojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                        Text(emoji).font(Font.system(size: fontSize)).frame(width: 40, height: 40)
                            .onTapGesture {
                                if themeToEdit.emojis.count > 2 {
                                    // TODO: Enhance the feedback with transition
                                    themeToEdit.removedEmojis.insert(themeToEdit.removeEmoji(emoji))
                                } else {
                                    // TODO: Will cause a Crash!
                                }
                            }
                    }
                    .frame(
                        minHeight: heightForEmojis * 0.55,
                        idealHeight: heightForEmojis * 0.7,
                        maxHeight: heightForRemovedEmojis
                    )
                }
                if !themeToEdit.removedEmojis.isEmpty {
                    Section("Bin") {
                        AspectVGrid(items: themeToEdit.removedEmojis.map { String($0) }, id: \.self, aspectRatio: 1) { emoji in
                            Text(emoji).font(Font.system(size: fontSize))
                        }
                        .frame(
                            minHeight: heightForRemovedEmojis * 0.55,
                            idealHeight: heightForRemovedEmojis * 0.7,
                            maxHeight: heightForRemovedEmojis
                        )
                    }
                }
                Section("Number of pairs of Cards") {
                    if themeToEdit.emojis.count > 0 {
                        Stepper(value: $themeToEdit.pairsOfCards, in: 2...themeToEdit.emojis.count) {
                            Text("\(themeToEdit.pairsOfCards) Pairs")
                        }
                    }
                }
                Section("Choose Color") {
                    ColorPicker(
                        "Color",
                        selection: Binding(
                            get: { Color(rgbaColor: themeToEdit.color) },
                            set: { color in return themeToEdit.set(color: color) }),
                        supportsOpacity: true   // TODO: Set the alpha to be watching this value
                    )
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    saveButton
                }
            }
        }
    }
    
    var saveButton: some View {
        ZStack {
            if themeToEdit.emojis.count > 3 {
                Button("Done") {
                    emojiTheme.add(theme: themeToEdit)
                    isPresented = false
                }
                .disabled(themeToEdit.emojis.count<4)
            } else {
                Button("Done") {
                    explainThemeInitialization = true
                    print("Failed to add Theme!")
                }
                .foregroundColor(.gray)
                .alert(isPresented: $explainThemeInitialization) {
                    return Alert(
                        title: Text("Failed To Create Theme"),
                        message: Text("A Theme would at least need Four emojis."),
                        dismissButton: .cancel(Text("ΟΚ"))
                    )
                }
            }
        }
    }
    
    // MARK: - Drawing Constants

    var heightForEmojis: CGFloat {
        CGFloat((themeToEdit.emojis.count - 1) / 6) * 70 + 70
        // Paul played around and came up with this sort of calculation as best fit!
    }
    
    var heightForRemovedEmojis: CGFloat {
        CGFloat((themeToEdit.removedEmojis.count - 1) / 6) * 70 + 70
    }
    
    let fontSize: CGFloat = 40
    
    func randomEmoji(_ count: UInt) -> String {
        let someRandomEmojis = [
            "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "😉",
            "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "😋", "😛",
            "💀", "👻", "🎃", "🪦", "🕷", "🧟‍♀️", "🧛🏻‍♀️", "👹", "⚽️", "🏀", "🏈",
            "⚾️", "🎾", "🏐", "🌵", "🎄", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️",
            "🍀", "🍄", "🪸", "🌾", "💐", "💐", "🪷", "🌺", "🌸", "🌼", "🌻",
            "🌹", "👨‍🦰", "👩‍🦰", "👨‍🦳", "👩‍🦳", "👩‍🦲", "🤮", "🤯", "🤪", "🤓", "🧐",
            "🕵️‍♂️", "🧝‍♂️", "🤴", "👸", "🤶", "🦸‍♂️", "🦹‍♂️", "🧙‍♂️", "👨‍⚕️", "👩‍⚕️", "👨‍🎓",
            "🐶", "🦊", "🐼", "🐯", "🦁", "🐸", "🐔", "🙈", "🐨", "🐌", "🦋",
            "🦄", "🐣", "🐻‍❄️", "🐮", "🐰", "🐹", "🐞", "🐢", "🦖", "🐡", "🐬",
            "🦢", "🐿", "🦔", "🕊", "🐈", "🦙", "🐏", "🐫", "🦣", "🦍", "🦈",
        ].shuffled()
        return someRandomEmojis.first! + someRandomEmojis.last!
        // TODO: Use count to return the specific number from emojis in a range ...
    }
}
