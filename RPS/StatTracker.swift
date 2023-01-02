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
            "# of times quit while losing": self.timesQuitWhileLosing,
            "# of times quit while tied or winning": self.timesQuitWhileNotLosing,
            "# times game opened": self.timesOpened,
            "# rocks picked": self.numRocks,
            "# papers picked": self.numPaper,
            "# scissors picked": self.numScissors,
        ]
    }
    
    // TODO: Add persistence to stats (save / load)
    func save() -> Void {
        
    }
    
    func load() -> Void {
        
    }

    // TODO: Add way to reset all stats, which should just create and save new StatTracker()
    func resetAll() -> Void {
        
    }
}
