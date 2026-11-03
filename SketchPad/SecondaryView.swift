//
//  SecondaryView.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
//

import SwiftUI

struct SecondaryView: View {
    
    @Environment(Brush.self) var globalBrush
    
    var body: some View {
        
        @Bindable var brush = globalBrush
        
        VStack {
            Text("I can edit the current brush")
                .font(.title)
            Tool(brush: brush)
            
        }
        .padding(8)
    }
}

#Preview {
    SecondaryView()
        .environment(Brush())
}
