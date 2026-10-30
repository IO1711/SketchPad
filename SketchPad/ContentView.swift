import SwiftUI
import Playgrounds

extension Double {
    var toRadians: Double {
        return self * .pi/180
    }
}


struct ContentView: View {
    
    @State var stroke: Stroke = Stroke(stroke: [])
    @State var drawing: Drawing = Drawing(drawing: [])
    @State var brush: Brush = Brush()
    
    var body: some View {
        
        VStack {
            Canvas(opaque: false,
                   colorMode: .linear,
                   rendersAsynchronously: false
            ) { context, size in
                
                var path = Path()
                
                if !stroke.stroke.isEmpty {
                    path.move(to: CGPoint(x: stroke.stroke[0].x, y: stroke.stroke[0].y))
                    
                    for point in stroke.stroke {
                        
                        path.addLine(to: CGPoint(x: point.x, y: point.y))
                    }
                    
                    context.stroke(path, with: .color(brush.getColor()), style: StrokeStyle(lineWidth: brush.getThickness(), lineCap: .round, lineJoin: .round))
                }
                
                
                for str in drawing.drawing {
                    
                    path.move(to: CGPoint(x: str.stroke[0].x, y: str.stroke[0].y))
                    
                    for point in str.stroke {
                        
                        path.addLine(to: CGPoint(x: point.x, y: point.y))
                    }
                    
                    context.stroke(path, with: .color(brush.getColor()), style: StrokeStyle(lineWidth: brush.getThickness(), lineCap: .round, lineJoin: .round))
                }
                
                //(402.0, 778.0)
                //(402.0, 874.0
            }
            .id(stroke.stroke.count)
            
            HStack {
                Button("Undo") {
                    undo()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Redo") {
                    drawing.redo()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        /*.onTapGesture { location in
         print(location)
         stroke.addPoint(Point(x: location.x, y: location.y))
         }*/
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged{ value in
                    print(value.translation)
                    stroke.addPoint(Point(x: value.location.x - 15, y: value.location.y - 15))
                }
                .onEnded{ _ in
                    drawing.addStroke(stroke)
                    stroke.resetStroke()
                    print(drawing)
                }
        )
        
        /*.onAppear{
         initStroke()
         }*/
    }
    
    
    func initStroke() {
        var i: Double = 1
        
        while i < 90 {
            let x = 170 + 100 * cos(i.toRadians)
            let y = 170 + 100 * sin(i.toRadians)
            
            stroke.addPoint(Point(x: x, y: y))
            i += 1
        }
        
        
    }
    
    func undo() {
        drawing.undo()
    }
}

#Preview {
    ContentView()
}
