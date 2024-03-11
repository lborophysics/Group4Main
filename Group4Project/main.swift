//
//  main.swift
//  Group4Tester
//
//  Created by (s) Adrian Chammas on 19/02/2024.
//
import Foundation

// Variables
let basename = "snapshot"
let hardwireSourceNode = 50
var frame = 0
let SIZE = 200
var ez = Array(repeating: 0.0, count: SIZE)
var hy = Array(repeating: 0.0, count: SIZE)
let imp0 = 377.0
let maxTime = 450

let fileout = FileWriter(fileName: "Electro.dat")
fileout.write_data(data: "")

for qTime in 0..<maxTime {
// Update magnetic field
update_magnetic(ez: ez, hy: &hy, imp0: imp0)

// Update electric field
update_electric(ez: &ez, hy: hy, imp0: imp0)

// Hardwire a source node
ez[hardwireSourceNode] += exp(-(Double(qTime) - 30.0) * (Double(qTime) - 30.0) / 100.0)

generateSnapshot(qTime: qTime)

fileout.append_data(data: "\(ez[50])\n")
}


 
