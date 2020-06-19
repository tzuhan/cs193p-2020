//
//  MemoryGame.swift
//  Create our Model
//
//  Created by Han.Hsu on 2020/6/11.
//  Copyright © 2020 Han.Hsu. All rights reserved.
//
//Foundation: basic library without swiftUI
import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    //mutating func: functions that modify it's "self", since struct is immutable
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for ind in 0..<self.cards.count {
            if self.cards[ind].id == card.id {
                return ind
            }
        }
        return 0 //TODO:jkl;
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for ind in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(ind)
            cards.append(Card(id: ind*2, isFaceUp: true, isMatched: false, content: content))
            cards.append(Card(id: ind*2+1, isFaceUp: true, isMatched: false, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        //content on the card
        var content: CardContent
    }
}

