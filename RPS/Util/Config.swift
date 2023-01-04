//
//  config.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import OrderedCollections

struct Config {
    private init() {}
    
    //    🪨📄✂️
    static let options: OrderedDictionary<String, String> = [
        "rock": "🪨",
        "paper": "📄",
        "scissors": "✂️"
    ]
    
    static let saveFileName = "persistent.json"
}

