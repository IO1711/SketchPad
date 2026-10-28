import SwiftUI
import Playgrounds

extension Double {
    var toRadians: Double {
        return self * .pi/180
    }
}


struct ContentView: View {
    
    @State var stroke: Stroke = Stroke(stroke: [])
    
    var body: some View {
        
        VStack {
            Canvas(opaque: false,
                   colorMode: .linear,
                   rendersAsynchronously: false
            ) { context, size in
                
                context.draw(Text("String(size)"), in: CGRect())
                
                /*let circle = Path(ellipseIn: CGRect(x: 20, y: 20, width: 100, height: 100))
                let circle2 = Path(ellipseIn: CGRect(x: 25, y: 25, width: 100, height: 100))
                let circle3 = Path(ellipseIn: CGRect(x: 30, y: 30, width: 100, height: 100))
                
                context.fill(circle, with: .color(.red))
                context.fill(circle2, with: .color(.red))
                context.fill(circle3, with: .color(.red))*/
                
                /*ForEach(stroke.stroke, id: \.self) { point in
                    let p = Path(ellipseIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
                    
                    context.fill(p, with: .color(.red))
                }*/
                
                for point in stroke.stroke {
                    let p = Path(ellipseIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
                    
                    context.fill(p, with: .color(.red))
                }
                
                //(402.0, 778.0)
                //(402.0, 874.0
            }
            .id(stroke.stroke.count)
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
                    //stroke.addPoint(Point(x: value.location.x, y: value.location.y))
                }
        )
        
        /*.onAppear{
            initStroke()
        }*/
    }
    
    
    func initStroke() {
        var i: Double = 1
        
        while i < 90 {
            var x = 170 + 100 * cos(i.toRadians)
            var y = 170 + 100 * sin(i.toRadians)
            
            stroke.addPoint(Point(x: x, y: y))
            i += 1
        }
        
        
    }
}

#Preview {
    ContentView()
}
