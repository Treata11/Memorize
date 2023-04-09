//
//  Array+Only.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/22/23.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
