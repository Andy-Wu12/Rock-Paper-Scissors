//
//  ContentView.swift
//  RPS-iOS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
//        🪨📄✂️
        VStack {
            HStack {
                Text("🪨")
                Text("📄")
                Text("✂️")
            }
            .font(.system(size: 100))
            .shadow(color: Color("UniversalPurple"), radius: 10)
            
            Text("Rock Paper Scissors")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("UniversalPurple"))
            
            Button("START") {
                
            }
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .font(.system(size: 25))
            .background(.green)
            .cornerRadius(10)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
