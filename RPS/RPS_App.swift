//
//  RPS_iOSApp.swift
//  RPS-iOS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

@main
struct RPS_iOSApp: App {
    @State private var statTracker = StatTracker.load()
    
    init() {
        statTracker.timesOpened += 1
        statTracker.save()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(statTracker: $statTracker)
        }
    }
}
