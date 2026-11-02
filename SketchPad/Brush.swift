//
//  Brush.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 29/10/2026.
//

import Foundation
import SwiftUI

struct Brush {
    var thickness: CGFloat = 4
    var color: Color = .red
    
    mutating func setColor(_ color: Color) {
        self.color = color
    }
    
    mutating func setThickness(_ thickness: CGFloat) {
        self.thickness = thickness
    }
    
    func getColor() -> Color {
        self.color
    }
    
    func getThickness() -> CGFloat {
        self.thickness
    }
}
