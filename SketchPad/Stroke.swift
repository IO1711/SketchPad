//
//  Stroke.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
//


struct Stroke {
    var stroke: [Point]
    var brush: Brush = Brush()
    
    mutating func addPoint(_ point: Point) {
        self.stroke.append(point)
    }
    
    mutating func resetStroke() {
        self.stroke = []
    }
}
