//
//  TitleButton.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

struct CustomNavButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(text) { action() }
        .frame(width: 100, height: 50)
        .foregroundColor(.white)
        .font(.system(size: 25))
        .background(Color("UniversalPurple"))
        .cornerRadius(10)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavButton(text: "Hello") {
            print("Clicked!")
        }
    }
}
