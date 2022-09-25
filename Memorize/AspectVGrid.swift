//
//  SwiftUIView.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/25/22.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid ()
//    }
//}
