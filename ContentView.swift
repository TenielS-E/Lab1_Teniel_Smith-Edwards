import SwiftUI

struct ContentView: View {
    // state to declare num
    @State private var number = Int.random(in: 1...100)
    @State private var timeCount = 5
    @State private var correct = 0
    @State private var count = 0
    @State private var result = ""
    @State private var answered = false
    @State private var alerted = false
    
    @State private var timer: Timer?
    
    
    var body: some View {
        VStack {
            Text("\(number)")
            
            Button(action: {
                answered = true
                isAnswer(primeAns: true)
            }, label: {
                Text("Prime")
            })
            
            Button(action: {
                answered = true
                isAnswer(primeAns: false)
            }, label: {
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
                  dismissButton: .default(Text("OK"), action: restart)
            )
        })
    }
    
    func startTime() {
        timeCount = 5
        result = ""
        answered = false
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeCount > 0 {
                timeCount -= 1
            } else if !answered {
                evaluate(primeAns: nil) // evaluates as incorrect
            }
        }
    }
    
    func isPrime(num: Int) -> Bool {
        guard num > 1 else { return false }
        for index in 2..<num {
            if num % index == 0 {
                return false
            }
        }
        return true
    }
    
    func evaluate(primeAns: Bool?) {
        let isNumPrime = isPrime(num: number)
        
        if let output = primeAns {
            if output == isNumPrime {
                result = "correct"
                correct += 1
            } else {
                result = "incorrect"
            }
        } else {
            result = "incorrect"
        }
        
        count += 1
        
        if count < 10 {
            number = Int.random(in: 1...100)
            startTime()
        } else {
            alerted = true
        }
    }
    
    func isAnswer(primeAns: Bool) {
        evaluate(primeAns: primeAns)
    }
    
    func restart(){
        correct = 0
        count = 0
        number = Int.random(in: 1...100)
        startTime()
    }
}


#Preview {
    ContentView()
}
