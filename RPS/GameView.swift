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
    @State private var resultText = ""
    
    var body: some View {
        VStack {
            // Scoreboard
            Scoreboard(leftName: "CPU", leftScore: cpuScore, rightName: "Player", rightScore: playerScore)
                .padding(.top)
            // CPU
            Spacer()
            OpponentView(revealed: $userMadeChoice)
            Spacer()
            Text(resultText)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
            // Player
            HStack {
                ForEach(Array(options.keys), id: \.self) { optionKey in
                    Button(action: {
                        userChoice = optionKey
                        userMadeChoice = true
                        
                        // Generate random choice for cpu
                        generateCPUChoice()
                        
                        // Check result
                        let result = checkWin(playerChoice: userChoice, cpuChoice: cpuChoice)
                        updateResult(result: result)
                        
                    }) {
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

    func getResultText(result: Int) -> String {
        switch result {
        case -1:
            return "Lose"
        case 0:
            return "Tie"
        case 1:
            return "Win"
        default:
            return "Error"
        }
    }
    
    // -1: lose, 0: draw, 1: win
    func checkWin(playerChoice: String, cpuChoice: String) -> Int {
        var result = 0
        
        if playerChoice == cpuChoice {
            result = 0
        } else if playerChoice == "rock" {
            if cpuChoice == "scissors" { result = 1 }
            else { result = -1 }
        } else if playerChoice == "paper" {
            if cpuChoice == "rock" { result = 1 }
            else { result = -1 }
        } else if playerChoice == "scissors" {
            if cpuChoice == "paper" { result = 1 }
            else { result = -1 }
        }
        return result
    }
    
    func generateCPUChoice() {
        cpuChoice = ["rock", "paper", "scissors"].randomElement()!
        
    }
    
    func updateResult(result: Int) {
        resultText = getResultText(result: result)
        if result == 1 {
            playerScore += 1
        } else if result == -1 {
            cpuScore += 1
        }
    }
}

struct OpponentView: View {
    @State private var choice: String = options.randomElement()!.key
    @Binding var revealed: Bool
    
    var body: some View {
        Group {
            if revealed {
                VStack {
                    Text("Opponent chose ")
                        .font(.system(size: 40))
                    Text(options[choice]!)
                        .iconStyle()
                }
                
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
