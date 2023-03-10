//
//  StatView.swift
//  RPS
//
//  Created by Andy Wu on 1/2/23.
//

import SwiftUI
import OrderedCollections

struct StatView: View {
    @Binding var tracker: StatTracker
    @Binding var showingStats: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(tracker.namesAndValues.keys), id: \.self) {
                        category in
                        Section {
                            StatCategory(name: category, statData: tracker.namesAndValues[category]!)
                        } header: {
                            Text(category)
                                .fontWeight(.heavy)
                        }
                    }
                    Section {
                        ForEach(Array(tracker.calculatedStats.keys), id: \.self) {
                            statName in
                            StatItem(name: statName, value: String(format: "%.2f", tracker.calculatedStats[statName]!))
                                .padding(.bottom)
                        }
                    } header: {
                        Text("Summary")
                            .fontWeight(.heavy)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            
            AdaptiveVerticalView {
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

struct StatCategory: View {
    var name: String
    var statData: OrderedDictionary<String, Int>
    
    var body: some View {
        ForEach(Array(statData.keys), id: \.self) {
            statName in
            StatItem(name: statName, value: String(statData[statName]!))
                .padding(.bottom)
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
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .background(Color("UniversalPurple"))
                    .clipShape(Capsule())
                Text(value)
                    .frame(width: geometry.size.width * 0.19, height: 30)
                    .font(.system(size: 16))
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
        
        StatView(tracker: $tracker, showingStats: $showing)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
