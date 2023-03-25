//
//  Grid.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/21/23.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout ) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}

/// func body(for item: Item, in layout: GridLayout ) -> some View {
///    let index = items.firstIndex(matching: item)
///    return Group {
///        if index != nil {
///            viewForItem(item)
///                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
///                .position(layout.location(ofItemAt: index!))
///        }
///    }
///}
