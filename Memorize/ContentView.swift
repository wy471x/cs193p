//
//  ContentView.swift
//  Memorize
//
//  Created by 万勇 on 2024/3/3.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🐶", "🥸", "🤡", "⚾️"]
    var body: some View {
        HStack {
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1])
            CardView(content: emojis[2],isFaceUp: true)
            CardView(content: emojis[3],isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
