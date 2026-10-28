//
//  Stroke.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 27/10/2026.
//


struct Stroke {
    var stroke: [Point]
    
    mutating func addPoint(_ point: Point) {
        self.stroke.append(point)
    }
}
