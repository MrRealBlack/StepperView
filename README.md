# StepperView
Custom stepper view built in SwiftUI

![Simulator Screen Shot - iPhone 12 - 2022-02-11 at 18 46 39 2](https://user-images.githubusercontent.com/20265908/153620702-c2292ca3-1424-49fa-a206-3d54999f54d9.png)

### Run Requirements

* Xcode 12
* Swift 5

#### How to use?
Using Stepper View is very simple. Just need to create an inatanse of `StepperView` and give it your items as `StepModel`.

```
    @State var currentState = 1

    let steps = [
        StepModel(stepNumber: 1, title: "One"),
        StepModel(stepNumber: 2, title: "Two"),
        StepModel(stepNumber: 3, title: "Three"),
        StepModel(stepNumber: 4, title: "Four"),
        StepModel(stepNumber: 5, title: "‍Five")
    ]
    
     StepperView(steps: steps, currentStep: $currentState, direction: .leftToRight)
     .frame(width: metrics.size.width, height: 100)
     .padding(.top, 10)
```
