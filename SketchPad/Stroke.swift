//
//  Stroke.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
//

import SwiftUI

struct Stroke {
    var stroke: [Point]
    var brush: BrushStyle = BrushStyle(thickness: CGFloat(8), color: .mint)
    
    mutating func addPoint(_ point: Point) {
        self.stroke.append(point)
    }
    
    mutating func resetStroke() {
        self.stroke = []
    }
    
    mutating func steStyle(_ brushStyle: Brush) {
        self.brush.color = brushStyle.color
        self.brush.thickness = brushStyle.thickness
    }
}
