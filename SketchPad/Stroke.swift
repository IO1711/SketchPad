//
//  Stroke.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 27/10/2026.
//

import Foundation

struct Stroke: Identifiable {
    let id: UUID = UUID()
    var stroke: [Point]
    var brush: Brush = Brush()
    
    mutating func addPoint(_ point: Point) {
        self.stroke.append(point)
    }
    
    mutating func resetStroke() {
        self.stroke = []
    }
}
