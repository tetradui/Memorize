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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            
        }


        .padding()
        .foregroundColor(.cyan)
        
    }
}

struct CardView: View{
    var isFaceUp: Bool = false
    
    var body: some View{
        
            ZStack(){
                if isFaceUp == true {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                
                Text("😃")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.cyan)
                
            }
        }
    }
}













#Preview {
    ContentView()
}
