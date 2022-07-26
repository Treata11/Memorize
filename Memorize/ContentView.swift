//
//  ContentView.swift
//  Memorize
//
//  Created by Alaa Norouzi on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🛸", "🚤", "🏍", "🚁", "🚀", "🚄", "🛩", "🛥", "🚢", "🛰", "🚜", "🚠", "🛶", "⛵️", "🚂", "🚟", "🚔", "🛴", "🦽", "🛻", "🚕", "🎠", "🎢", "🏎"]
    @State var emojiCount = 24
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 69))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(1000/1618, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.orange ) //function with arguement label
        }
        .padding(.horizontal)
    }

struct CardView: View {
    @State var isFaceUp: Bool! = true
    var content: String
    
    var body: some View {
        return ZStack { //zstack function is a view builder
            let shape = RoundedRectangle(cornerRadius: 13)
            if isFaceUp {
                shape.stroke(lineWidth: 3)
                shape.fill(.yellow)
                Text(content).font(.largeTitle)
            } else {
                shape
                    .fill(.red)
                }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






















    






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        }
    }
}
