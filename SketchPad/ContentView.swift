import SwiftUI
import Playgrounds

extension Double {
    var toRadians: Double {
        return self * .pi/180
    }
}


struct ContentView: View {
    
    @State var drawing: Drawing = Drawing(drawing: [])
    @State var stroke: Stroke = Stroke(stroke: [])
    
    var body: some View {
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
                    
                    context.stroke(path, with: .color(stroke.brush.color), style: StrokeStyle(lineWidth: stroke.brush.thickness))
                }
                
                
                //saved drawing
                for str in drawing.drawing {
                    var path = Path()
                    
                    path.move(to: CGPoint(x: str.stroke[0].x, y: str.stroke[0].y))
                    
                    for point in str.stroke {
                        path.addLine(to: CGPoint(x: point.x, y: point.y))
                    }
                    
                    context.stroke(path, with: .color(str.brush.color), style: StrokeStyle(lineWidth: str.brush.thickness))
                }
                
            }
            .gesture (
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let location = value.location
                        
                        stroke.addPoint(Point(x: location.x, y: location.y))
                        
                        
                    }
                    .onEnded { value in
                        drawing.addStroke(stroke)
                        
                        stroke.resetStroke()
                    }
                    
            )
            
            ColorPicker("Pick color", selection: $stroke.brush.color)
            
            Slider(value: $stroke.brush.thickness, in: 0...10)
            
            HStack {
                Button {
                    drawing.undo()
                } label: {
                    Image(systemName: "arrow.uturn.backward")
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    drawing.redo()
                } label: {
                    Image(systemName: "arrow.uturn.forward")
                }
                .buttonStyle(.borderedProminent)
                
                Button("Clear") {
                    drawing.clear()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(10)
    }
}

#Preview {
    ContentView()
}
