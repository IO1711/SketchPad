//
//  Layer.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 06/11/2026.
//

import Foundation

@Observable
class Layer: Codable {
    var name: String
    var drawing : DrawingStruct
    
    init(name: String, drawing: DrawingStruct) {
        self.name = name
        self.drawing = drawing
    }
    
    enum CodingKeys: String, CodingKey {
        case name, drawing
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.drawing = try container.decode(DrawingStruct.self, forKey: .drawing)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(drawing, forKey: .drawing)
    }
}
