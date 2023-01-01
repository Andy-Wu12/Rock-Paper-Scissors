//
//  ModifierTemplates.swift
//  RPS
//
//  Created by Andy Wu on 12/31/22.
//

import SwiftUI

extension View {
    func iconStyle() -> some View {
        self.font(.system(size: 100))
            .fontWeight(.heavy)
            .foregroundColor(Color("UniversalPurple"))
            .shadow(color: Color("UniversalPurple"), radius: 10)
    }
}
