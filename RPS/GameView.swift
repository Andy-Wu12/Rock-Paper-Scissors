//
//  GameView.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Array(options.keys), id: \.self) { optionKey in
                    Button(action: {}) {
                        VStack {
                            Text(options[optionKey]!)
                            Text(optionKey)
                                .font(.title)
                        }
                    }
                }
            }
            .iconStyle()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
