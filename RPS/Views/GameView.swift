//
//  GameView.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct GameView: View {
    @Binding var gameStarted: Bool
    @Binding var tracker: StatTracker
    
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
            
            AdaptiveVerticalView {
                // CPU
                Spacer()
                OpponentView(choice: $cpuChoice, revealed: $userMadeChoice)
                Spacer()
                
                // Post-guess information
                VStack {
                    if resultText != "" {
                        Text(resultText)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Button("Play again") {
                            reset()
                        }
                        .font(.largeTitle)
                        .padding(.horizontal)
                        .iconStyle()
                    }
                }
                Spacer()
                // Player
                if !userMadeChoice {
                    HStack {
                        ForEach(Array(options.keys), id: \.self) { optionKey in
                            Button(action: {
                                /* Prints true when reproducing #2,
                                   which means the button is still active even though userMadeChoice is correctly set to true
                                   and the views shouldn't be rendered.
                                 */
                                // print(userMadeChoice)
                                onChoiceClick(optionKey)
                            }) {
                                VStack {
                                    Text(options[optionKey]!)
                                    Text(optionKey)
                                        .font(.title)
                                }
                            }
                        }
                        .iconStyle()
                    }
                } else {
                    Text("\(options[userChoice]!)")
                        .iconStyle()
                        
                }
                Spacer()
            }
            CustomNavButton(text: "QUIT", action: {
                if cpuScore > playerScore { tracker.timesQuitWhileLosing += 1 }
                else { tracker.timesQuitWhileNotLosing += 1 }
                quitGame()
            })
        }
    }

    func onChoiceClick(_ choiceKey: String) {
        if !userMadeChoice {
            tracker.roundsPlayed += 1
            userChoice = choiceKey
            userMadeChoice = true
            
            // Generate random choice for cpu
            generateCPUChoice()
            
            // Check result
            let result = checkWin(playerChoice: userChoice, cpuChoice: cpuChoice)
            updateResult(result: result)
        }
    }
    
    func getResultText(result: Int) -> String {
        switch result {
        case -1:
            tracker.losses += 1
            return "Lose"
        case 0:
            tracker.ties += 1
            return "Tie"
        case 1:
            tracker.wins += 1
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
            tracker.numRocks += 1
            if cpuChoice == "scissors" { result = 1 }
            else { result = -1 }
            
        } else if playerChoice == "paper" {
            tracker.numPaper += 1
            if cpuChoice == "rock" { result = 1 }
            else { result = -1 }
            
        } else if playerChoice == "scissors" {
            tracker.numScissors += 1
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
    
    func reset() {
        cpuChoice = ""
        userChoice = ""
        userMadeChoice = false
        resultText = ""
    }
    
    func quitGame() {
        reset()
        cpuScore = 0
        playerScore = 0
        gameStarted = false
    }
}

struct OpponentView: View {
    @Binding var choice: String
    @Binding var revealed: Bool
    
    var body: some View {
        Group {
            if revealed {
                VStack {
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
        .font(.system(size: 30))
        .fontWeight(.heavy)
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var started: Bool = false
    @State static var tracker = StatTracker()
    static var previews: some View {
        GameView(gameStarted: $started, tracker: $tracker)
    }
}
