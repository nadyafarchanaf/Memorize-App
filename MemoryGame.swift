//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nadya Farchana Fidaroina on 10/08/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let  chooseIndex = cards.firstIndex(where: {$0.id == card.id}),  !cards[chooseIndex].isFaceUp,
            !cards[chooseIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chooseIndex].content == cards[potentialMatchIndex].content {
                    cards[chooseIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
            else {
                for index in cards.indices  {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
            }
            cards[chooseIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCard: Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCard = 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
