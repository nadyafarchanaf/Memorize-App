//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nadya Farchana Fidaroina on 10/08/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emoji = ["😎", "🙇‍♀️","👌","💕","👀","🪗","🥰","😛","😄","⛔️","🦁","🦋","🐼","🎾"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 3) { pairIndex in
            emoji[pairIndex]
        }
    }
    
    @Published private  var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        

    
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK - Intents(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

