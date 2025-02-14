import SwiftUI

struct ContentView: View {
    // state to declare num
    @State private var num = Int.random(in: 1...100)
    @State private var timeCount = 5
    @State private var correct = 0
    @State private var result = ""
    
    
    var body: some View {
        VStack {
            Text("\(num)")
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Prime")
            })
            
            Button(action: {}, label: {
                Text("Not Prime")
            })
            
            Text("\(result)")
            
            Text("Time")
            
            
            
        }
    }
}


#Preview {
    ContentView()
}
