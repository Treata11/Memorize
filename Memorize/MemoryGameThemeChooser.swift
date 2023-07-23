//
//  MemoryGameThemeChooser.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/13/23.
//

import SwiftUI

struct MemoryGameThemeChooser: View {
    @EnvironmentObject var emojiThemes: EmojiThemes
    
    @State var sheetPresented = false
    @State private var selectedTheme: Theme?
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiThemes.savedThemes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme))
                        .navigationTitle(theme.name)) {
                            ZStack(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 7) {
                                    HStack() {
                                        Text(theme.name).font(.title)
                                        Spacer()
                                        Text(cardCount(for: theme))
                                    }
                                    Text(emojiString(for: theme)).font(.largeTitle)
                                }
                                VStack(alignment: .trailing) {
                                    if editMode.isEditing {
                                        Button {
                                            editCurrent(theme: theme)
                                            print("success")
                                        } label: {
                                            Image(systemName: "square.and.pencil").font(.largeTitle)
                                        }
                                        .foregroundColor(Color(rgbaColor: theme.color)).colorInvert()
                                    }
                                }
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button(action: {
                                editCurrent(theme: theme)
                                print("Success")
                                }) {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.blue)
                        }
                        .listRowBackground(color(for: theme))
                }
                .onDelete { indexSet in
                    indexSet.map { emojiThemes.savedThemes[$0] }.forEach { theme in
                        emojiThemes.remove(theme: theme)
                    }
                }
            }
            .sheet(isPresented: $sheetPresented) {  // TODO: onDismiss: (() -> Void)?
                ThemeEditor(theme: $selectedTheme)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Emoji Themes")
            .navigationBarItems(
                leading: EditButton()
            )
            .environment(\.editMode, $editMode)
            .navigationBarItems(
                trailing: Button {
                        // TODO: UI for creation of new Themes
                    addNewTheme()
                } label: {
                    Image(systemName: "plus").font(.title2)
                }
            )
        }
    }
    
    private func addNewTheme() {
        selectedTheme = nil
        sheetPresented = true
    }
    
    private func editCurrent(theme: Theme) {
        selectedTheme = theme
        sheetPresented = true
    }
    
    private func emojiString(for theme: Theme) -> String {  // Bogus!
        var emojis: Set<String> = []
        for _ in 0..<5 {
            emojis.insert(theme.emojis.randomElement()!)
        }
        return emojis.map{ String($0) }.joined(separator: " ")
    }
    
    private func color(for theme: Theme) -> LinearGradient {
        LinearGradient(
            colors: [
                Color(rgbaColor: theme.color).opacity(0.03),
                Color(rgbaColor: theme.color).opacity(0.05),
                Color(rgbaColor: theme.color).opacity(0.11),
                Color(rgbaColor: theme.color).opacity(0.23),
                Color(rgbaColor: theme.color).opacity(0.31),
                Color(rgbaColor: theme.color).opacity(0.43),
                Color(rgbaColor: theme.color).opacity(0.61),
                Color(rgbaColor: theme.color).opacity(0.73),
                Color(rgbaColor: theme.color).opacity(0.89),
                Color(rgbaColor: theme.color).opacity(0.97),
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    private func cardCount(for theme: Theme) -> String {
        // TODO: Use CustomStringConvertible instead
        let description = "Pairs: "
        return description + String(theme.emojis.count)
    }
 }

struct MemoryGameThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameThemeChooser().environmentObject(EmojiThemes())
    }
}
