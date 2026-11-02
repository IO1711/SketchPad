//
//  Drawing.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
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
            self.drawing.append(lastRemoved)
        }
    }
    
    mutating func clear() {
        self.drawing = []
        
        if let _ = self.lastRemoved {
            self.lastRemoved = nil
        }
    }
}
