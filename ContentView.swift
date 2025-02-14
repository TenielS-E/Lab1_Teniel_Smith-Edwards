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
            
            Text("\(timeCount)")
                    
        }
        .padding()
        .onAppear()
        .alert(isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/, content: {
            Alert(title: Text("Quiz Ended"),
            message: Text("Total: \(correct)/10"),
                  dismissButton: .default(Text("OK"), action: restart()))
        })
    }
    

        
}


#Preview {
    ContentView()
}
