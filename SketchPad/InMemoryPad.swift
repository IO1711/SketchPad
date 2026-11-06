//
//  InMemoryPad.swift
//  SketchPad
//
//  Created by Bilolbek Rayimov on 06/11/2026.
//

import SwiftUI

struct InMemoryPad: View {
    
    @State var stroke: Stroke = Stroke(stroke: [])
    @Environment(Brush.self) private var globalBrush
    @State var layers: [Layer] = [Layer(name: "Main", drawing: DrawingStruct(drawing: [], lastRemoved: []))]
    
    @State var activeLayerIndex = 0
    
    var activeLayer: Layer {
        get { layers[activeLayerIndex] }
    }
    
    @State var showingPopover = false
    @State var layerName = "default"
    
    var body: some View {
        @Bindable var brush = globalBrush
        
        NavigationStack {
            VStack {
                Canvas(
                    opaque: false,
                    colorMode: .linear,
                    rendersAsynchronously: false
                ) { context, size in
                    
                    var path = Path()
                    
                    //live stroke
                    if !stroke.stroke.isEmpty {
                        path.move(to: CGPoint(x: stroke.stroke[0].x, y: stroke.stroke[0].y))
                        
                        for point in stroke.stroke {
                            path.addLine(to: CGPoint(x: point.x, y: point.y))
                        }
                        
                        context.stroke(path, with: .color(brush.color), style: StrokeStyle(lineWidth: brush.thickness))
                    }
                    
                    
                    //saved drawing
                    for layer in layers {
                        for str in layer.drawing.drawing {
                            var path = Path()
                            
                            path.move(to: CGPoint(x: str.stroke[0].x, y: str.stroke[0].y))
                            
                            for point in str.stroke {
                                path.addLine(to: CGPoint(x: point.x, y: point.y))
                            }
                            
                            context.stroke(path, with: .color(str.brush.color), style: StrokeStyle(lineWidth: str.brush.thickness))
                        }
                    }
                    
                    /*for str in drawing.drawing {
                        var path = Path()
                        
                        path.move(to: CGPoint(x: str.stroke[0].x, y: str.stroke[0].y))
                        
                        for point in str.stroke {
                            path.addLine(to: CGPoint(x: point.x, y: point.y))
                        }
                        
                        context.stroke(path, with: .color(str.brush.color), style: StrokeStyle(lineWidth: str.brush.thickness))
                    }*/
                    
                }
                .gesture (
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let location = value.location
                            
                            stroke.addPoint(Point(x: location.x, y: location.y))
                            stroke.steStyle(brush)
                            
                            
                        }
                        .onEnded { value in
                            
                            activeLayer.drawing.addStroke(stroke)
                            
                            //layers.append(activeLayer)
                            
                            stroke.resetStroke()
                        }
                        
                )
                
                //ColorPicker("Pick color", selection: $stroke.brush.color)
                
                //Slider(value: $stroke.brush.thickness, in: 0...10)
                
                Tool(brush: brush)
                    
                
                HStack {
                    Button {
                        activeLayer.drawing.undo()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        activeLayer.drawing.redo()
                    } label: {
                        Image(systemName: "arrow.uturn.forward")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Clear") {
                        activeLayer.drawing.clear()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Add layer") {
                        showingPopover = true
                    }
                    .buttonStyle(.borderedProminent)
                    .alert( "" ,isPresented: $showingPopover) {
                        
                        TextField("Layer name", text: $layerName)
                        
                        HStack {
                            Button("Save") {
                                
                                var newLayer = Layer(name: layerName, drawing: DrawingStruct(drawing: [], lastRemoved: []))
                                
                                layers.append(newLayer)
                                
                                activeLayerIndex += 1
                                
                                
                                print(layerName)
                            }
                            
                            Button("Discard") {
                                print(layerName)
                            }
                        }
                    }
                    
                    Button("Save") {
                        
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(10)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("Select layer", selection: $activeLayerIndex) {
                        ForEach(Array(layers.enumerated()), id: \.offset) { index, layer in
                            Text(layer.name).tag(index)
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    InMemoryPad()
        .environment(Brush())
}
