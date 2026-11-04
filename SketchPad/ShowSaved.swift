//
//  ShowSaved.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 04/11/2026.
//

import SwiftUI
import SwiftData

struct ShowSaved: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var drawings: [Drawing]
    
    @ViewBuilder
    private var allSaved: some View {
        if !drawings.isEmpty {
            ScrollView {
                VStack {
                    ForEach(drawings) { drawing in
                        Canvas(opaque: false) { context, _ in
                            for stroke in drawing.drawing {
                                guard let first = stroke.stroke.first else { continue }

                                var path = Path()
                                path.move(to: CGPoint(x: first.x, y: first.y))

                                for point in stroke.stroke {
                                    path.addLine(to: CGPoint(x: point.x, y: point.y))
                                }

                                context.stroke(
                                    path,
                                    with: .color(stroke.brush.color),
                                    lineWidth: stroke.brush.thickness
                                )
                            }
                        }
                        .frame(height: 600)
                    }
                }
            }
        } else {
            Text("No drawing found")
        }
    }
    
    var body: some View {
        VStack {
            
            
            allSaved
            
        }
        .padding(10)
    }
}



#Preview {
    ShowSaved()
}
