//
//  Drawing.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
//


struct Drawing {
    var drawing: [Stroke]
    var lastRemoved: [Stroke]
    
    mutating func addStroke(_ stroke: Stroke) {
        self.drawing.append(stroke)
    }
    
    mutating func undo() {
        if let last = self.drawing.popLast() {
            self.lastRemoved.append(last)
        }
    }
    
    mutating func redo() {
        if let last = self.lastRemoved.popLast() {
            self.drawing.append(last)
        }
    }
    
    mutating func clear() {
        self.drawing = []
        
        self.lastRemoved = []
    }
}
