//
//  ContentView.swift
//  RPS-iOS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct MainView: View {
    @State private var started = false
    @State private var statTracker = StatTracker()
    
    var body: some View {
        VStack {
            if !started {
                TitleView()
                TitleButton(text: "START", action: {
                    statTracker.timesStarted += 1
                    started.toggle()
                })
            } else {
                GameView(gameStarted: $started, tracker: $statTracker)
            }
        }
        .padding()
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            ForEach(Array(options.keys), id: \.self) { optionKey in
                VStack {
                    Text(options[optionKey]!)
                    Text(optionKey)
                        .font(.title)
                }
            }
        }
        .iconStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

