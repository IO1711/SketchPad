import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        VStack {
            Canvas(opaque: false,
                   colorMode: .linear,
                   rendersAsynchronously: false
            ) { context, size in
                
                context.draw(Text("String(size)"), in: CGRect())
                
                let circle = Path(ellipseIn: CGRect(x: 20, y: 20, width: 100, height: 100))
                
                context.fill(circle, with: .color(.red))
                
                context.stroke(circle, with: .color(.black))
                //(402.0, 778.0)
                //(402.0, 874.0
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
