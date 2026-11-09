//
//  Drawing.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 02/11/2026.
//
import SwiftData
import Foundation

@Model
final class Drawing {
    var id: UUID
    var drawing: [Stroke]
    var lastRemoved: [Stroke]
    
    init(drawing: [Stroke], lastRemoved: [Stroke]) {
        self.id = UUID()
        self.drawing = drawing
        self.lastRemoved = lastRemoved
    }
    
    func addStroke(_ stroke: Stroke) {
        self.drawing.append(stroke)
    }
    
    func undo() {
        if let last = self.drawing.popLast() {
            self.lastRemoved.append(last)
        }
    }
    
    func redo() {
        if let last = self.lastRemoved.popLast() {
            self.drawing.append(last)
        }
    }
    
    func clear() {
        self.drawing = []
        
        self.lastRemoved = []
    }
}
