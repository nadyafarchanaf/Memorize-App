//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nadya Farchana Fidaroina on 05/08/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game )
        }
    }
}
