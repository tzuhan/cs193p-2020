//
//  EmojiMemoryGame.swift
//  HW1
//  ViewModel
//
//  Created by Han.Hsu on 2020/6/11.
//  Copyright © 2020 Han.Hsu. All rights reserved.
//

import SwiftUI

//ObservableObject is only for "class"
class EmojiMemoryGame: ObservableObject {
    //"@Publish": Property wrapper,
    @Published private var game = EmojiMemoryGame.createMemoryGame()
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = [
        "🍑", "🥑", "🥕", "🐛", "🐱"]/*, "🐶", "🙏🏼", "🤛🏼", "🙌🏼", "👌🏼",
        "😇", "😂", "😭", "👿", "😈", "💪🏼", "👅", "👀", "🙅🏼‍♀️", "🙆🏼‍♀️"]*/
        let pairCount: Int = Int.random(in: 2...5)
        return MemoryGame<String> (numberOfPairsOfCards: pairCount) { pairIndex in
            emojis[pairIndex]
        }
    } //the model
    //private: let variable game to be only viewable and modifiable by EmojiMemoryGame, 600
    //private(set), 644, set var game to be only modifiable by EmojiMemoryGame, but can be viewed by all other files
    
    
    
    // MARK: - Access To the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
        //"return" can be omitted
    }
    
    
    // MARK: - Create Intents:
    func choose(card: MemoryGame<String>.Card) {
        /*ObservableObject defined object, but better way is to change our model "game" to @Published
        //objectWillChange.send() */
        game.choose(card: card)
    }
    
    
    // MARK:

}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
