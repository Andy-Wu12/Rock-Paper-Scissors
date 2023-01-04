//
//  ContentView.swift
//  RPS-iOS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct MainView: View {
    @State private var showingStats = false
    @State private var started = false
    @State private var statTracker = StatTracker.load()
    
    var body: some View {
        // Would be cleaner to add navigation view, but less "game feel"
        VStack {
            if started {
                GameView(gameStarted: $started, tracker: $statTracker)
            } else if showingStats {
                StatView(tracker: $statTracker, showingStats: $showingStats)
            } else {
                TitleView()
                CustomNavButton(text: "START", action: {
                    statTracker.timesStarted += 1
                    started.toggle()
                })
                CustomNavButton(text: "STATS", action: {
                    showingStats.toggle()
                })
            }
        }
        .padding()
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            ForEach(Array(Config.options.keys), id: \.self) { optionKey in
                VStack {
                    Text(Config.options[optionKey]!)
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

