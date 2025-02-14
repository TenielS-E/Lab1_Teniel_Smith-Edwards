import SwiftUI

struct ContentView: View {
    // state to declare num
    @State private var num = 0
    
    var body: some View {
        VStack {
            Text("\(num)")
            
            
        }
    }
}


#Preview {
    ContentView()
}
