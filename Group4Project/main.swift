//
//  main.swift
//  Group4Tester
//
//  Created by (s) Adrian Chammas on 19/02/2024.
//

import Foundation

print("Hello, World!")

print("susy")

print("This may be working")

print("Hello")

print("branchie")

print("branchie")

print("hello")

print("TEST")

print("hello there")

import Foundation

let SIZE = 200
var ez = Array(repeating: 0.0, count: SIZE)
var hy = Array(repeating: 0.0, count: SIZE)
let imp0 = 377.0
let maxTime = 250

for qTime in 0..<maxTime {
   // Update magnetic field
   for mm in 0..<(SIZE - 1) {
       hy[mm] += (ez[mm + 1] - ez[mm]) / imp0
   }

   // Update electric field
   for mm in 1..<SIZE {
       ez[mm] += (hy[mm] - hy[mm - 1]) * imp0
   }

   // Hardwire a source node
   ez[0] = exp(-(Double(qTime) - 30.0) * (Double(qTime) - 30.0) / 100.0)

    let fileout = FileWriter(fileName: "Electro.dat")
    fileout.append_data(data: "\(ez[50])")
}
