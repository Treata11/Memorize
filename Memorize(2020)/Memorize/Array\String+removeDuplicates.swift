//
// Array/String+removeDuplicates.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/25/23.
//

import Foundation
import SwiftUI

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
    
    func randomizedElement() -> Element? {
        guard !isEmpty else {
            return nil
        }
        var seenElements = Set<Element>()
        repeat {
            if let randomElement = self.randomElement(), !seenElements.contains(randomElement) {
                seenElements.insert(randomElement)
                return randomElement
            }
        } while true
    }
    
    func sequencedElement() -> Element? {
                guard !isEmpty else {
                    return nil
                }
                var currentIndex = startIndex
                while currentIndex != endIndex {
                    let sequencedElement = self[currentIndex]
                    formIndex(after: &currentIndex)
                    return sequencedElement
                }
                return nil
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
//        return self = String(self.filter{ encounteredChars[$0] == 1 } )
//    }
//}

extension String {
    mutating func removeDuplicateCharacters() -> String {
        let setOfCharacters = Set(self.map{ String($0) })
        return setOfCharacters.reduce("") { String($0)  + String($1) }
    }
}

extension Collection where Element: Hashable {
//    func randomizedElement() -> Element? {
//        guard !isEmpty else {
//            return nil
//        }
//        var seenElements = Set<Element>()
//        repeat {
//            if let randomElement = self.randomElement(), !seenElements.contains(randomElement) {
//                seenElements.insert(randomElement)
//                return randomElement
//            }
//        } while true
//    }
    
//    func sequencedElement() -> Element? {
//                guard !isEmpty else {
//                    return nil
//                }
//                var currentIndex = startIndex
//                while currentIndex != endIndex {
//                    let sequencedElement = self[currentIndex]
//                    formIndex(after: &currentIndex)
//                    return sequencedElement
//                }
//                return nil
//            }
}

extension Array where Element: Comparable {
    func randomElement<T: RandomNumberGenerator>(using generator: inout T) -> Element? {
        guard !self.isEmpty else { return nil }
        let randomIndex = Int.random(in: 0..<self.count, using: &generator)
        return self[randomIndex]
    }
}

