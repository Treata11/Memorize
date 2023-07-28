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
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiThemes.savedThemes) { theme in
                    if editMode.isEditing == true {
                        NavigationLink(destination: ThemeEditor(theme: Binding(get: { theme }, set: { _ in return } ), isPresented: $sheetPresented)) {
                            ThemeDescription(theme: theme)
                        }
                        .listRowBackground(linearGradient(for: theme))
                    } else {
                        NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme))
                            .navigationTitle(theme.name)) {
                                ThemeDescription(theme: theme)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button(action: {
                                    editCurrent(theme: Binding(get: { theme }, set: { _ in return } ))
                                    print("Editing: \(theme)")
                                }) {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.blue)
                            }
                            .listRowBackground(linearGradient(for: theme))
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { emojiThemes.savedThemes[$0] }.forEach { theme in
                        emojiThemes.remove(theme: theme)
                    }
                }
                .onMove { emojiThemes.savedThemes.move(fromOffsets: $0, toOffset: $1) } // Bogus!
            }
            .sheet(isPresented: $sheetPresented) {  // TODO: onDismiss: (() -> Void)?
                ThemeEditor(theme: $selectedTheme, isPresented: $sheetPresented)
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
    
//    private func editCurrent(theme: Theme) {
//        // Bug: The first time that this funciton is called
//        //the state of the selectedTheme is not set to the theme
//        selectedTheme = State(wrappedValue: theme).wrappedValue
//        sheetPresented = true
//    }
    
    private func editCurrent(theme: Binding<Theme>) {
        selectedTheme = theme.wrappedValue as Theme
        sheetPresented = true
    }
    
    private func linearGradient(for theme: Theme) -> LinearGradient {
        LinearGradient(
            colors: [
                Color(rgbaColor: theme.color).opacity(0.03),
                Color(rgbaColor: theme.color).opacity(0.05),
                Color(rgbaColor: theme.color).opacity(0.11),
                Color(rgbaColor: theme.color).opacity(0.23),
                Color(rgbaColor: theme.color).opacity(0.31),
                Color(rgbaColor: theme.color).opacity(0.43),
                Color(rgbaColor: theme.color).opacity(0.53),
                Color(rgbaColor: theme.color).opacity(0.61),
                Color(rgbaColor: theme.color).opacity(0.73),
                Color(rgbaColor: theme.color).opacity(0.87),
                Color(rgbaColor: theme.color).opacity(0.91),
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
 }

struct ThemeDescription: View {
    let theme: Theme
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 7) {
                HStack() {
                    Text(theme.name).font(.title)
                    Spacer()
                    Text(cardCount(for: theme))
                }
                Text(emojiString(for: theme)).font(.largeTitle)
            }
        }
    }
    
    private func emojiString(for theme: Theme) -> String {  // Bogus!
        let emojis = Array(theme.emojis)
        let count = emojis.count - 1
        let indices = [count/1, count/2, count/3, count/5]
        
        var result = [String]()
        
        for index in indices {
            result.append(emojis[index])
        }
            
        return result.map { String($0) }.joined(separator: " ")
        //        var emojis: Set<String> = []
        //        for _ in 0..<5 {
        //            emojis.insert(theme.emojis.randomElement()!)
        //        }
        //        return emojis.map{ String($0) }.joined(separator: " ")
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
