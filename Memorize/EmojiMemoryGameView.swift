//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by yongwan on 2024/3/3.
//

import SwiftUI
 
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color) 
                //.animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
