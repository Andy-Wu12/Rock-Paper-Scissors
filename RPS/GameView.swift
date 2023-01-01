//
//  GameView.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct GameView: View {
    @State private var cpuChoice = ""
    @State private var userChoice = ""
    @State private var userMadeChoice: Bool = false
    @State private var cpuScore = 0
    @State private var playerScore = 0
    
    var body: some View {
        VStack {
            // Scoreboard
            Scoreboard(leftName: "CPU", leftScore: cpuScore, rightName: "Player", rightScore: playerScore)
            // CPU
            Spacer()
            OpponentView(revealed: userMadeChoice)
            Spacer()
            // Player
            HStack {
                ForEach(Array(options.keys), id: \.self) { optionKey in
                    Button(action: {}) {
                        VStack {
                            Text(options[optionKey]!)
                            Text(optionKey)
                                .font(.title)
                        }
                    }
                }
            }
            .iconStyle()
            Spacer()
        }
    }
}

struct OpponentView: View {
    @State private var choice: String = options.randomElement()!.key
    @State var revealed: Bool
    
    var body: some View {
        Group {
            if revealed {
                Text("Your opponent chose \(options[choice]!)")
                    .font(.system(size: 40))
            } else {
                Text("Waiting for you to choose")
                    .font(.system(size: 25))
            }
        }
        .fontWeight(.bold)
    }
}

struct Scoreboard: View {
    var leftName: String
    var leftScore: Int
    
    var rightName: String
    var rightScore: Int
    
    var body: some View {
        HStack {
            HStack {
                Text(leftName)
                    .foregroundColor(.red)
                Text("- \(leftScore) : \(rightScore) -")
                Text(rightName)
                    .foregroundColor(.green)
            }
        }
        .font(.system(size: 40))
        .fontWeight(.heavy)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
