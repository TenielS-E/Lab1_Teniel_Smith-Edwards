import SwiftUI

struct ContentView: View {
    // state to declare num
    @State private var num = Int.random(in: 1...100)
    @State private var timeCount = 5
    @State private var correct = 0
    @State private var count = 0
    @State private var result = ""
    @State private var answered = false
    @State private var alerted = false
    
    @State private var timer: Timer?
    
    
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
        .alert(isPresented: $alerted, content: {
            Alert(title: Text("Quiz Ended"),
            message: Text("Total: \(correct)/10"),
                  dismissButton: .default(Text("OK"), action: restart()))
        })
    }
    
    func startTime() {
        timeCount = 5
        result = ""
        answered = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeCount > 0 {
                timeCount -= 1
            } else if !answered {
                // evaluate(primeAns: nil) // evaluates as incorrect
            }
        }
    }
    func restart(){
        correct = 0
        count = 0
        num = Int.random(in: 1...100)
        startTime()
    }
}


#Preview {
    ContentView()
}
