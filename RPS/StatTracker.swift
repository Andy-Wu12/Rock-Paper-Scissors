//
//  StatTracker.swift
//  RPS
//
//  Created by Andy Wu on 1/1/23.
//

import Foundation
import OrderedCollections

class StatTracker: Codable {
    var wins: Int = 0
    var losses: Int = 0
    var ties: Int = 0
    var roundsPlayed: Int = 0
    var timesStarted: Int = 0 // # start button clicks
    var timesQuitWhileLosing: Int = 0
    var timesQuitWhileNotLosing: Int = 0
    var timesOpened: Int = 0
    
    var numRocks: Int = 0
    var numPaper: Int = 0
    var numScissors: Int = 0
    
    var namesAndValues: OrderedDictionary<String, OrderedDictionary<String, Int>> {
        [
            "Win / Loss Record": [
                "Wins": self.wins,
                "Losses": self.losses,
                "Ties": self.ties,
            ],
            "Game History": [
                "Rounds played": self.roundsPlayed,
                "Games started": self.timesStarted,
                "Quits while losing": self.timesQuitWhileLosing,
                "Quits while tied or winning": self.timesQuitWhileNotLosing,
            ],
            "Choices Made": [
                "Rocks picked": self.numRocks,
                "Papers picked": self.numPaper,
                "Scissors picked": self.numScissors,
            ],
            "Miscellaneous": [
                "# Times game opened": self.timesOpened,
            ]
        ]
    }
    
    var calculatedStats: OrderedDictionary<String, Double> {
        let roundsDivisor = self.roundsPlayed == 0 ? 1 : self.roundsPlayed
        let timesStartedDivisor = self.timesStarted == 0 ? 1 : self.timesStarted
        
        return [
            "Win Ratio": Double(self.wins) / Double(roundsDivisor),
            "Rounds Played Per Game": Double(self.roundsPlayed) / Double(timesStartedDivisor),
            "Rock Percentage": Double(self.numRocks) / Double(roundsDivisor),
            "Paper Percentage": Double(self.numPaper) / Double(roundsDivisor),
            "Scissors Percentage": Double(self.numScissors) / Double(roundsDivisor)
        ]
    }
    
    func save() -> Void {
        do {
            try writeDocument(name: Config.saveFileName, for: self)
        } catch {
//            print(error.localizedDescription)
            return
        }
    }
    
    static func load() -> StatTracker {
        if let statTracker: StatTracker = try? readDocument(name: Config.saveFileName) {
            return statTracker
        } else {
            return StatTracker()
        }
    }

    // Alternative way to do this is to hardcode every stat back to initial value, which doesn't require reassigning instance
    func resetAll() -> Void {
        do {
            try writeDocument(name: Config.saveFileName, for: StatTracker())
        } catch {
            return
        }
    }
}
