    //
//  main.swift
//  Group4Tester
//
//  Created by (s) Adrian Chammas on 19/02/2024.
//
import Foundation

// Variables
let basename = "snapshot"
var frame = 0
let SIZE = 200
var ez = Array(repeating: 0.0, count: SIZE)
var hy = Array(repeating: 0.0, count: SIZE)
let imp0 = 377.0
let maxTime = 250

let fileout = FileWriter(fileName: "Electro.dat")
fileout.write_data(data: "")

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

    generateSnapshot(qTime: qTime)

    fileout.append_data(data: "\(ez[50])\n")
}

print("testing")
 
