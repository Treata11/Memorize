//
//  UtilityExtentions.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/22/23.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
