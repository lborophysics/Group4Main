//
//  Smoothing Function.swift
//  Group4Project
//
//  Created by (s) Adrian Chammas on 13/05/2024.
//

/*
 how could I code a Sigmund function to show smooth transition of a time dependant dielectric

 what about for swift
 */

import Foundation


func sigmoidFunction(_ t: Double, _ startTime: Double, _ transitionTime: Double) -> Double {
    let endTime = startTime + transitionTime
    if t < startTime {
        return 0.0
    } else if t > endTime {
        return 1.0
    } else {
        return 0.5 * (1 + tanh((t - startTime - transitionTime / 2) / (transitionTime / 2)))
    }
}

public func smoothTransitionDielectric(_ t: Double, _ startTime: Double, _ transitionTime: Double, _ initialEpsilon: Double, _ finalEpsilon: Double) -> Double {
    let sigmoid = sigmoidFunction(t, startTime, transitionTime)
    return initialEpsilon + sigmoid * (finalEpsilon - initialEpsilon)
}

// Parameters
//let totalTime = 10.0  // Total time of the transition
//let transitionTime = 5.0  // Time taken to transition from initialEpsilon to finalEpsilon
//let initialEpsilon = 2.0  // Initial dielectric constant
//let finalEpsilon = 5.0  // Final dielectric constant

// Time loop
//let timeStep = 0.1
//for currentTime in stride(from: 0, through: totalTime, by: timeStep) {
  //  let epsilon = smoothTransitionDielectric(currentTime, 0, transitionTime, initialEpsilon, finalEpsilon)
 //   print("Time: \(currentTime), Epsilon: \(epsilon)")
//}
