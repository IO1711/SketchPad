//
//  Tool.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 03/11/2026.
//

import SwiftUI

struct Tool: View {
    
    @Bindable var brush : Brush
    
    
    
    var body: some View {
        ColorPicker("Pick color", selection: $brush.color)
            
        
        Slider(value: $brush.thickness, in: 0...10)
            
    }
    
}

/*#Preview {
    
    var testColor: Color
    
    Tool(brushStyleColor: $testColor, brushStyleThickness: )
}*/


