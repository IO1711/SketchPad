//
//  Layer.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 06/11/2026.
//

import Foundation

@Observable
class Layer {
    var name: String
    var drawing : DrawingStruct
    
    init(name: String, drawing: DrawingStruct) {
        self.name = name
        self.drawing = drawing
    }
}
