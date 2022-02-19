//
//  SwiftUIView.swift
//  
//
//  Created by Mehdi Gilanpour on 2/19/22.
//

import SwiftUI

struct StepModel: Hashable {
    var stepNumber: Int
    var title: String
    var state: StepState = .notPassed
}

enum StepState: Hashable {
    case passed
    case notPassed
    case current
    
    var color: Color {
        switch self {
        case .passed:
            return .green
        case .notPassed, .current:
            return .gray
        }
    }
    
    var borderColor: Color {
        switch self {
        case .passed, .notPassed:
            return .clear
        case .current:
            return .green
        }
    }
}

struct StepView: View {
    
    @Binding var currentStep: Int
    var step: StepModel

    init(step: StepModel, currentStep: Binding<Int>? = nil) {
        self.step = step
        _currentStep = currentStep ?? .constant(0)
    }
    
    var body: some View {
        VStack {
            Text(step.title)
            ZStack {
                Circle()
                    .strokeBorder(step.state.borderColor, lineWidth: 4)
                    .background(Circle().fill(step.state.color))
                    .frame(width: 30, height: 30)
                Text("\(step.stepNumber)")
            }
        }.onTapGesture {
            currentStep = step.stepNumber
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(step: StepModel(stepNumber: 0, title: "New", state: .passed))
    }
}
