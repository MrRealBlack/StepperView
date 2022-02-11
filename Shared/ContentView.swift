//
//  ContentView.swift
//  Shared
//
//  Created by Mehdi Gilanpour on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentState = 1
    let steps = [
        StepModel(stepNumber: 1, title: "One"),
        StepModel(stepNumber: 2, title: "Two"),
        StepModel(stepNumber: 3, title: "Three"),
        StepModel(stepNumber: 4, title: "Four"),
        StepModel(stepNumber: 5, title: "‍Five")
    ]
    
    var body: some View {
        VStack {
            GeometryReader { metrics in
                StepperView(steps: steps, currentStep: $currentState, direction: .leftToRight)
                    .frame(width: metrics.size.width, height: 100)
                    .padding(.top, 10)
            }
            
            HStack {
                if currentState > 1 {
                    Button("Previous") {
                        self.currentState -= 1
                    }
                }
                
                Spacer()
                
                if currentState <= steps.count {
                    Button(currentState < steps.count ? "Next" : "Done") {
                        if self.currentState <= steps.count {
                            self.currentState += 1
                        }
                    }
                }
                
            }.padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
