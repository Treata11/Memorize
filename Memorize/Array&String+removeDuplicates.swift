//
// Array/String+removeDuplicates.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/25/23.
//
import Foundation

//struct TODO<Element> where Element: Hashable {
//    let array: Array<Any>
//
//    func removeDuplicates(_ array: Array<Element>) -> Array<Element> {
//        var set = Set<Element>()
//        for element in array {
//            set
//        }
//    }
//}
extension Array where Element: Hashable {
    mutating func removeDuplicates() {
        let set = Set<Element>(self)
        self = Array(set)
    }
}

//extension String {
//    mutating func removeDuplicateCharacters() {
//        var encounteredChars = [Character: Int]()
//        for char in self {
//            if let count = encounteredChars[char] {
//                encounteredChars[char] = count + 1
//            } else {
//                encounteredChars[char] = 1
//            }
//        }
//        self = String(self.filter{ encounteredChars[$0] == 1 } )
//    }
//}
extension String {
    mutating func removeDuplicateCharacters() -> String {
        let arrayOfCharacters = Set(self.map{ String($0) })
//        return arrayOfCharacters.removeDuplicates()
        return arrayOfCharacters.reduce("") { String($0) + String($1) }
    }
    
    mutating func removeDuplicates() -> String {
        var uniqueString = ""
        
        for character in self {
            if !uniqueString.contains(character) {
                uniqueString.append(character)
            }
        }
        
        return uniqueString
    }
}
