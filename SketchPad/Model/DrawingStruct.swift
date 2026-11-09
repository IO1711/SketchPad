//
//  DrawingStruct.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 06/11/2026.
//


import SwiftData
import Foundation

struct DrawingStruct: Decodable, Encodable {
    var id: UUID
    var drawing: [Stroke]
    var lastRemoved: [Stroke]
    
    init(drawing: [Stroke], lastRemoved: [Stroke]) {
        self.id = UUID()
        self.drawing = drawing
        self.lastRemoved = lastRemoved
    }
    
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
