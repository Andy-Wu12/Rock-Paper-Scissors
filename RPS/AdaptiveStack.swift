//
//  AdaptiveStack.swift
//  RPS
//
//  Created by Andy Wu on 1/1/23.
//

import SwiftUI

struct AdaptiveVerticalView<Content>: View where Content: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if verticalSizeClass == .regular {
            VStack { content }
        } else {
            HStack { content }
        }
    }
}

struct AdaptiveVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveVerticalView {
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
        }
        .previewInterfaceOrientation(.landscapeLeft)
        
        
        AdaptiveVerticalView {
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
            Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm")
        }
        .previewInterfaceOrientation(.portrait)
    }
}
