//
//  EmojiMemoryGameView.swift
//  HW1
//
//  Created by Han.Hsu on 2020/6/9.
//  Copyright © 2020 Han.Hsu. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        /*
        Original:
            "return HStack(content: {...})"
        1. "return" can be removed =>
            HStack(content: {})
        2. if the "last parameter of instance Init func" is a "{}", you can deduce it to =>
            HStack() { ... }
        3. if the parentheses () is empty => you can remove it =>
            HStack {...}
        */
        HStack {
            ForEach(gameViewModel.cards) { card in
                CardView(card: card, cardCount: self.gameViewModel.cards.count).onTapGesture {
                    self.gameViewModel.choose(card: card)
                }
            }
        }.padding().foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    let cardCount: Int
    var body: some View {
        ZStack {
            //multiple views in ZStack
            //overlapping text is called behind roundedRectangle
            //x-index stack
            
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3)
                self.cardCount >= 10 ?Text(card.content).font(Font.body) : Text(card.content).font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.aspectRatio(2/3.0, contentMode: .fit)
    }
    init (card: MemoryGame<String>.Card, cardCount: Int) {
        self.card = card
        self.cardCount = cardCount
    }
}
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame())
    }
}
