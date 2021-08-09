//
//  ContentView.swift
//  Memorize
//
//  Created by Asani on 05/08/21.
//

import SwiftUI

struct ContentView: View {
    var emoji = ["😎", "🙇‍♀️","👌","💕","👀","🪗","🥰","😛","😄","⛔️","🦁","🦋","🐼","🎾"]
    @State var emojiCount = 6
    var body: some View {
        VStack {
            Text("Memorize").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.red)
            ScrollView {
                LazyVGrid( columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(emoji[0..<emojiCount], id: \.self) { emojis in
                        CardView(content: emojis).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    var remove: some View {
        Button {
            if emojiCount>1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            if emojiCount<emoji.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = false
        
        var body: some View{
            let shape = RoundedRectangle(cornerRadius: 10)
            ZStack {
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth:2).foregroundColor(.orange)
                    Text(content).font(.title).foregroundColor(Color.yellow)
                } else {
                    shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
            .preferredColorScheme(.light)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
}
