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
                        ForEach(Array(tracker.namesAndValues.keys), id: \.self) { statName in
                            StatItem(name: statName, value: String(tracker.namesAndValues[statName]!))
                                .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Statistics")
                
                CustomNavButton(text: "BACK", action: {
                    showingStats = false
                })
                CustomNavButton(text: "RESET", action: {
                    tracker = StatTracker()
                    tracker.resetAll()
                })
            }
        }
    }
}

struct StatItem: View {
    var name: String
    var value: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("\(name)")
                    .frame(width: geometry.size.width * 0.80, height: 30)
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .background(Color("UniversalPurple"))
                    .clipShape(Capsule())
                Text("\(value)")
                    .frame(width: geometry.size.width * 0.19, height: 30)
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .background(Color("UniversalPurple"))
                    .clipShape(Capsule())
            }
        }
    }
}

struct StatView_Previews: PreviewProvider {
    @State static var tracker = StatTracker()
    @State static var showing = true
    static var previews: some View {
        StatView(tracker: $tracker, showingStats: $showing)
    }
}
