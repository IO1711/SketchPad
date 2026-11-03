import SwiftUI
import Playgrounds

extension Double {
    var toRadians: Double {
        return self * .pi/180
    }
}


struct ContentView: View {
    //@Environment(Brush.self) private var globalBrush
    
    var body: some View {
        TabView {
            MainView()
                .tag(1)
            SecondaryView()
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
        .environment(Brush())
}
