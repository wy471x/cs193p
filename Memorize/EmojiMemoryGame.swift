//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by yongwan on 2024/10/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🐶", "🥸", "🤡", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️","🥸"
    ,"🥸","🥸","🥸","🥸","🐶", "🥸", "🤡", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️", "⚾️","🥸"]
    private static let error = "⁉️"
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return error
            }
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: Intent
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
