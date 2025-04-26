//
//  ContentView.swift
//  Memorize
//
//  Created by Kutman Almazbekov on 25/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(){
            CardView()
            CardView()
            CardView()
            CardView()
            
        }


        .padding()
        .foregroundColor(.cyan)
        
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = true
    
    var body: some View{
        
            ZStack(){
                let rectang = RoundedRectangle(cornerRadius: 12)
                if isFaceUp == true {
                rectang
                    .fill(Color.white)
                
                rectang
                    .strokeBorder(lineWidth: 2)
                
                Text("😃")
                    .font(.largeTitle)
            } else {
                rectang
                    .fill(Color.cyan)
                
                   }
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
    }
}













#Preview {
    ContentView()
}
