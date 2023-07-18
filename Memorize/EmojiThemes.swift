//
//  EmojiMemoryGameStore.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/13/23.
//

import SwiftUI
import Combine

class EmojiThemes: ObservableObject
{
    @Published var savedThemes: [Theme]
//    @Published var ThemeModel = Theme(from: <#Decoder#>)
    
    static let persistanceKey = "EmojiMemoryGameSavedThemes"
    
    init() {
        if let json = UserDefaults.standard.data(forKey: Self.persistanceKey) {
            if let decodedData = try? JSONDecoder().decode([Theme].self, from: json) {
                self.savedThemes = decodedData
            }
        }
        self.savedThemes = Theme.themes
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(savedThemes) {
            UserDefaults.standard.set(data, forKey: Self.persistanceKey)
        }
    }
    
    func add(theme: Theme) {
        if let index = savedThemes.firstIndex(matching: theme) {
            savedThemes[index] = theme
        } else {
            savedThemes.append(theme)
        }
        save()
    }
    
    func remove(theme: Theme) {
        if let index = savedThemes.firstIndex(matching: theme) {
            savedThemes.remove(at: index)
            save()
        }
    }
 
//    func removeEmojis(_ emojisToRemove: String, from theme: Theme) -> String {
//        if let index = savedThemes.firstIndex(matching: theme) {
//            savedThemes[index] = theme
//            theme.removeEmoji(emojisToRemove)
//        }
//    }
}

extension Collection where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
    // note that contains(matching:) is different than contains()
    // this version uses the Identifiable-ness of its elements
    // to see whether a member of the Collection has the same identity
    func contains(matching element: Element) -> Bool {
        self.contains(where: { $0.id == element.id })
    }
}
