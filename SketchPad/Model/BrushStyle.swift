//
//  BrushStyle.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 03/11/2026.
//

//import Foundation
import SwiftUI

struct BrushStyle: Codable {
    var thickness: CGFloat
    var color: Color
    
    
    enum CodingKeys: String, CodingKey {
        case thickness, colorHex
    }
    
    init(thickness: CGFloat, color: Color) {
        self.thickness = thickness
        self.color = color
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.thickness = try container.decode(CGFloat.self, forKey: .thickness)
        
        let hex = try container.decode(String.self, forKey: .colorHex)
        
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0
        
        self.color = Color(.sRGB, red: r, green: g, blue: b, opacity: 1.0)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(thickness, forKey: .thickness)
        
        let uiColor = UIColor(color)
        var r: CGFloat = 0; var g: CGFloat = 0; var b: CGFloat = 0; var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let hexString = String(format: "%02lX%02lX%02lX", lroundf(Float(r) * 255), lroundf(Float(g) * 255), lroundf(Float(b) * 255))
        
        try container.encode(hexString, forKey: .colorHex)
    }
}
