//
//  Drawing.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 29/10/2026.
//


struct Drawing {
    var drawing: [Stroke]
    var lastRemoved: Stroke?
    
    mutating func addStroke(_ stroke: Stroke) {
        self.drawing.append(stroke)
    }
    
    mutating func undo() {
        self.lastRemoved = self.drawing.popLast()
    }
    
    mutating func redo() {
        if let lastRemoved = self.lastRemoved {
            drawing
                .append(lastRemoved)
        }
    }
    
    mutating func clear() {
        self.drawing = []
        
        if let lastRemoved = self.lastRemoved {
            self.lastRemoved = nil
        }
    }
}
