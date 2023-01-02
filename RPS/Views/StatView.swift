//
//  StatView.swift
//  RPS
//
//  Created by Andy Wu on 1/2/23.
//

import SwiftUI

struct StatView: View {
    @Binding var tracker: StatTracker
    @Binding var showingStats: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        // TODO: Find way to get stats to show up in certain order. Maybe OrderedDict?
                        ForEach(Array(tracker.namesAndValues.keys), id: \.self) { statName in
                            StatColumn(name: statName, value: String(tracker.namesAndValues[statName]!))
                                .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Statistics")
                
                CustomNavButton(text: "BACK", action: {
                    showingStats = false
                })
            }
        }
    }
}

struct StatColumn: View {
    var name: String
    var value: String
    
    var body: some View {
        Text("\(name) - \(value)")
            // TODO: Make font size more dynamic
            .font(.system(size: 18))
            .fontWeight(.heavy)
            .foregroundColor(Color("UniversalPurple"))
    }
}

struct StatView_Previews: PreviewProvider {
    @State static var tracker = StatTracker()
    @State static var showing = true
    static var previews: some View {
        StatView(tracker: $tracker, showingStats: $showing)
    }
}
