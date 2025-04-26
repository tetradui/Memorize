//
//  ContentView.swift
//  Memorize
//
//  Created by Kutman Almazbekov on 25/4/25.
//

import SwiftUI

struct ContentView: View {
    
    let emojis:[String] = ["😃","🥰","😇", "🤪","😜","😭","👾","🥸","🫨","🤨","👹"]
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack{
            ScrollView{
                cardsView
            }
            
            Spacer()
            cardsAdjuster
            
            
        }
        .padding()
    }
        
    
    var cardsAdjuster: some View{
        HStack{
            
            cardRemover
            Spacer()
            cardAdder
        
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View{
        Button (action: {
            cardCount += offset
            
        }, label: {
            Image(systemName: symbol)
            
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count )
        
    }
    
    
    var cardsView: some View{
        LazyVGrid(columns:[GridItem(),GridItem()]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
            
        }.foregroundColor(.cyan)
    }
    
    

    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "plus")
        
    }
        
}




struct CardView: View{
    @State var isFaceUp: Bool = true
    let content: String
    
    var body: some View{
            ZStack(){
                let rectang = RoundedRectangle(cornerRadius: 12)
                Group {
                    rectang.fill(Color.white)
                
                    rectang.strokeBorder(lineWidth: 2)
                
                    Text(content).font(.largeTitle)
                }
                    .opacity(isFaceUp ? 1 : 0)
                rectang.fill().opacity(isFaceUp ? 0 : 1)
                
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
    }
}













#Preview {
    ContentView()
}
