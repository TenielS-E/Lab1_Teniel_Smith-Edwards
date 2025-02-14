import SwiftUI

struct ContentView: View {
    // state to declare num
    @State private var num = 0
    
    var body: some View {
        VStack {
            Text("\(num)")
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Prime")
            })
            
        }
    }
}


#Preview {
    ContentView()
}
