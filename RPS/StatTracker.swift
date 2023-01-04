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
    var timesOpened: Int = 0 // TODO: # of times app opened
    
    var numRocks: Int = 0
    var numPaper: Int = 0
    var numScissors: Int = 0
    
    var namesAndValues: OrderedDictionary<String, Int> {
        [
            "Wins": self.wins,
            "Losses": self.losses,
            "Ties": self.ties,
            "Rounds Played": self.roundsPlayed,
            "Games Started": self.timesStarted,
            "Quits while losing": self.timesQuitWhileLosing,
            "Quits while tied or winning": self.timesQuitWhileNotLosing,
//            "# Times Game opened": self.timesOpened,
            "Rocks picked": self.numRocks,
            "Papers picked": self.numPaper,
            "Scissors picked": self.numScissors,
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

    // TODO: Add way to reset all stats, which should just create and save new StatTracker()
    // Alternative way to do this is to hardcode every stat back to initial value, which doesn't require reassigning instance
    func resetAll() -> Void {
        do {
            try writeDocument(name: Config.saveFileName, for: StatTracker())
        } catch {
            return
        }
    }
}
