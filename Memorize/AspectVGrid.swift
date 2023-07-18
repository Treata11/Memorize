//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/18/23.
//

import SwiftUI

struct AspectVGrid<Item, ID, ItemView>: View where ItemView: View, ID: Hashable {
    var items: [Item]
    var id: KeyPath<Item,ID>
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], id: KeyPath<Item,ID>, aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.id = id
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items, id: id) { item in
                        content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
            }
            Spacer(minLength: 0)
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
                            
    private func widthThatFits(itemCount: Int, in size: CGSize,  itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / CGFloat(itemAspectRatio)
            if itemHeight * CGFloat(rowCount) < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}

extension AspectVGrid where Item: Identifiable, ID == Item.ID {
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.init(items: items, id: \Item.id, aspectRatio: aspectRatio, content: content)
    }
}
